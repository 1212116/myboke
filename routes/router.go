package routes

import (
	"github.com/gin-contrib/multitemplate"
	"github.com/gin-gonic/gin"
	v1 "myboke/api/v1"
	"myboke/middleware"
	"myboke/utils"
)

func createMyRender() multitemplate.Renderer {
	p := multitemplate.NewRenderer()
	p.AddFromFiles("admin", "web/admin/dist/index.html")
	p.AddFromFiles("front", "web/front/dist/index.html")
	return p
}

func InitRouter() {
	gin.SetMode(utils.AppMode)

	r := gin.New()
	// 设置信任网络 []string
	// nil 为不计算，避免性能消耗，上线应当设置
	_ = r.SetTrustedProxies(nil)

	r.HTMLRender = createMyRender()
	r.Use(middleware.Logger())
	r.Use(gin.Recovery())
	r.Use(middleware.Cors())

	r.Static("/static", "./web/front/dist/static")
	r.Static("/admin", "./web/admin/dist")
	r.StaticFile("/favicon.ico", "/web/front/dist/favicon.ico")

	r.GET("/", func(c *gin.Context) {
		c.HTML(200, "front", nil)
	})

	r.GET("/admin", func(c *gin.Context) {
		c.HTML(200, "admin", nil)
	})

	auth := r.Group("api/v1")
	auth.Use(middleware.JwtToken())
	{
		//用户模块的路由接口

		//修改
		auth.PUT("user/:id", v1.EditUser)
		//删除
		auth.DELETE("user/:id", v1.DeleteUser)

		//分类模块的路由接口

		//添加
		auth.POST("category/add", v1.AddCategory)
		//修改
		auth.PUT("category/:id", v1.EditCate)
		//删除
		auth.DELETE("category/:id", v1.DeleteCate)

		//文章模块的路由接口
		//添加
		auth.POST("article/add", v1.AddArticle)
		//修改
		auth.PUT("article/:id", v1.EditArt)
		//删除
		auth.DELETE("article/:id", v1.DeleteArt)
		//上传文件
		auth.POST("upload", v1.Upload)
		//修改个人信息
		auth.PUT("profile/:id", v1.UpdateProfile)
	}
	router := r.Group("api/v1")
	{

		//添加
		router.POST("user/add", v1.AddUser)
		//获取user列表
		router.GET("users", v1.GetUsers)
		//获取单个user
		router.GET("user/:id", v1.GetUserInfo)

		//获取分类列表
		router.GET("category", v1.GetCate)
		//查询分类下所有文章
		router.GET("article/cate/:id", v1.GetCateArt)
		//查询单个信息
		auth.GET("category/:id", v1.GetCateInfo)

		//获取文章列表
		router.GET("articles", v1.GetArt)
		//获取单个文章信息
		router.GET("article/info/:id", v1.GetArtInfo)

		//登录
		router.POST("login", v1.Login)

		//获取个人信息
		router.GET("profile/:id", v1.GetProfile)
	}

	r.Run(":" + utils.HttpPort)
}

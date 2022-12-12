import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ArticleList from '../components/ArticleList'
import Details from '../components/Details'
import CateArt from '../components/CateArt'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    children: [
      { path: '/', component: ArticleList, meta: { title: '欢迎来到LuoBaoBlog' } },
      { path: '/detail/:id', component: Details, meta: { title: '文章详情' }, props: true },
      { path: '/cateArt/:id', component: CateArt, meta: { title: '分类下文章' }, props: true }
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
})

export default router

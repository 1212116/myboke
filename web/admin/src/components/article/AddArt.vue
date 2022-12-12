<template>
  <div>
    <a-card>
      <h3>{{ id ? '编辑文章' : '新增文章' }}</h3>
      <a-form-model :model="artInfo" ref="artInfoRef" :rules="artInfoRules" :hideRequiredMark="true">
        <a-form-model-item label="文章标题" prop="title">
          <a-input style="width: 300px" v-model="artInfo.title"></a-input>
        </a-form-model-item>
        <a-form-model-item label="文章分类" prop="cid">
          <a-select v-model="artInfo.cid" style="width: 300px" placeholder="请选择分类" @change="cateChange">
            <a-select-option v-for="item in Catelist" :key="item.id" :value="item.id">{{ item.name }}</a-select-option>
          </a-select>
        </a-form-model-item>
        <a-form-model-item label="文章描述" prop="desc">
          <a-input type="textarea" v-model="artInfo.desc"></a-input>
        </a-form-model-item>
        <a-form-model-item label="文章缩略图" prop="img">
          <a-upload
            name="file"
            :multiple="false"
            :action="upUrl"
            :headers="headers"
            @change="upChange"
            listType="picture"
            :defaultFileList="fileList"
          >
            <a-button> <a-icon type="upload" /> 点击上传 </a-button>
          </a-upload>
          <br />
          <template v-if="id">
            <img :src="artInfo.img" style="width: 120px; height: 100px" />
          </template>
        </a-form-model-item>
        <a-form-model-item label="文章内容" prop="content">
          <a-input type="textarea" v-model="artInfo.content"></a-input>
        </a-form-model-item>
        <a-form-model-item>
          <a-button type="primary" @click="artOk(artInfo.id)">{{ artInfo.id ? '更新' : '提交' }}</a-button>
          <a-button type="primary" style="margin-left: 15px" @click="addCancel">取消</a-button>
        </a-form-model-item>
      </a-form-model>
    </a-card>
  </div>
</template>

<script>
import { Url } from '../../plugin/http'
export default {
  props: ['id'],
  data() {
    return {
      artInfo: {
        id: 0,
        title: '',
        cid: undefined,
        desc: '',
        content: '',
        img: ''
      },
      Catelist: [],
      upUrl: Url + '/upload',
      headers: {},
      fileList: [],
      artInfoRules: {
        title: [{ required: true, message: '请输入文章标题', trigger: 'blur' }],
        cid: [{ required: true, message: '请选择分类', trigger: 'blur' }],
        desc: [{ required: true, message: '请输入文章描述', trigger: 'blur' }],
        img: [{ required: true, message: '请添加图片', trigger: 'blur' }],
        content: [{ required: true, message: '请输入文章内容', trigger: 'blur' }]
      }
    }
  },
  created() {
    this.getCateList()
    this.headers = { Authorization: `Bearer ${window.sessionStorage.getItem('token')}` }
    if (this.id) {
      this.getArtInfo(this.id)
    }
    if (this.id === 0) {
      this.$refs.artInfoRef.resetFields()
    }
  },
  methods: {
    // 查询文章信息
    async getArtInfo(id) {
      const { data: res } = await this.$http.get(`article/info/${id}`)
      if (res.status !== 200) {
        if (res.status === 1004 || res.status === 1005 || res.status === 1006 || res.status === 1007) {
          window.sessionStorage.clear()
          this.$router.push('/login')
        }
        this.$message.error(res.message)
      }
      console.log(res.data)
      this.artInfo = res.data
      this.artInfo.id = res.data.ID
    },
    // 获取分类
    async getCateList() {
      const { data: res } = await this.$http.get('category')
      if (res.status !== 200) {
        if (res.status === 1004 || res.status === 1005 || res.status === 1006 || res.status === 1007) {
          window.sessionStorage.clear()
          this.$router.push('/login')
        }
        this.$message.error(res.message)
      }
      this.Catelist = res.data
    },
    // 选择分类
    cateChange(value) {
      this.artInfo.cid = value
    },
    // 上传图片
    upChange(info) {
      if (info.file.status !== 'uploading') {
        console.log(info.file, info.fileList)
      }
      if (info.file.status === 'done') {
        this.$message.success('图片上传成功')
        const imgUrl = info.file.response.url
        this.artInfo.img = imgUrl
      } else if (info.file.status === 'error') {
        this.$message.error('图片上传失败')
      }
    },
    // 提交&&更新文章
    artOk(id) {
      this.$refs.artInfoRef.validate(async (valid) => {
        if (id === 0) {
          const { data: res } = await this.$http.post('article/add', this.artInfo)
          if (res.status !== 200) this.$message.error(res.message)
          this.$router.push('/artlist')
          this.$message.success('添加文章成功')
        } else {
          const { data: res } = await this.$http.put(`article/${id}`, this.artInfo)
          if (res.status !== 200) this.$message.error(res.message)
          this.$router.push('/artlist')
          this.$message.success('更新文章成功')
        }
      })
    },
    // 取消
    addCancel() {
      this.$refs.artInfoRef.resetFields()
    }
  }
}
</script>

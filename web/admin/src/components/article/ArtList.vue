<template>
  <div>
    <h3>文章列表页面</h3>
    <a-card>
      <a-row>
        <a-col :span="6">
          <a-input-search
            v-model="queryParam.title"
            placeholder="输入文章名查找"
            enter-button
            @search="searchArt"
            allowClear
          />
        </a-col>
        <a-col :span="4">
          <a-button type="primary" style="margin-left: 10px" @click="$router.push('/addart')">新增</a-button>
        </a-col>
        <a-col :span="6" :offset="4" >
          <a-select defaultValue="请选择分类" @change="CateChange" style="width: 200px">
            <a-select-option v-for="item in Catelist" :key="item.id" :value="item.id">{{
              item.name
            }}</a-select-option>
          </a-select>
        </a-col>
      </a-row>

      <a-table
        rowKey="ID"
        :columns="columns"
        :pagination="pagination"
        :dataSource="Artlist"
        bordered
        @change="handleTableChange"
      >
        <span slot="img" slot-scope="img">
          <img class="artImg" :src="img" />
        </span>
        <template slot="action" slot-scope="data">
          <div class="actionSlot">
            <a-button type="primary" icon="edit" style="margin-right: 15px" @click="$router.push(`/addart/${data.ID}`)">编辑</a-button>
            <a-button type="danger" icon="delete" style="margin-right: 15px" @click="deleteArt(data.ID)">删除</a-button>
          </div>
        </template>
      </a-table>
    </a-card>
  </div>
</template>

<script>
const columns = [
  {
    title: 'ID',
    dataIndex: 'ID',
    width: '5%',
    key: 'id',
    align: 'center'
  },
  {
    title: '分类',
    dataIndex: ['Category', 'name'],
    width: '10%',
    key: 'name',
    align: 'center'
  },
  {
    title: '文章标题',
    dataIndex: 'title',
    width: '10%',
    key: 'title',
    align: 'center'
  },
  {
    title: '文章描述',
    dataIndex: 'desc',
    width: '20%',
    key: 'desc',
    align: 'center'
  },
  {
    title: '文章缩略图',
    dataIndex: 'img',
    width: '20%',
    key: 'img',
    align: 'center',
    scopedSlots: { customRender: 'img' }
  },
  {
    title: '操作',
    width: '20%',
    key: 'action',
    align: 'center',
    scopedSlots: { customRender: 'action' }
  }
]
export default {
  data() {
    return {
      pagination: {
        pageSizeOptions: ['5', '10', '20'],
        pageSize: 5,
        total: 0,
        showSizeChanger: true,
        showTotal: (total) => `共${total}条`
      },
      Artlist: [],
      Catelist: [],
      columns,
      queryParam: {
        title: '',
        pagesize: 5,
        pagenum: 1
      }
    }
  },
  created() {
    this.getArtList()
    this.getCateList()
  },
  methods: {
    // 查询文章列表
    async getArtList() {
      const { data: res } = await this.$http.get('articles', {
        params: {
          pagesize: this.queryParam.pagesize,
          pagenum: this.queryParam.pagenum
        }
      })
      if (res.status !== 200) {
        if (res.status === 1004 || res.status === 1005 || res.status === 1006 || res.status === 1007) {
          window.sessionStorage.clear()
          this.$router.push('/login')
        }
        this.$message.error(res.message)
      }
      this.Artlist = res.data
      this.pagination.total = res.total
    },
    // 搜索文章
    async searchArt() {
      this.queryParam.pagenum = 1
      this.pagination.current = 1
      const { data: res } = await this.$http.get('articles', {
        params: {
          title: this.queryParam.title,
          pagesize: this.queryParam.pagesize,
          pagenum: this.queryParam.pagenum
        }
      })
      if (res.status !== 200) return this.$message.error(res.message)
      this.Artlist = res.data
      this.pagination.total = res.total
    },
    // 更改分页
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination }
      pager.current = pagination.current
      pager.pageSize = pagination.pageSize
      this.queryParam.pagesize = pagination.pageSize
      this.queryParam.pagenum = pagination.current

      if (pagination.pageSize !== this.pagination.pageSize) {
        this.queryParam.pagenum = 1
        pager.current = 1
      }
      this.pagination = pager
      this.getArtList()
    },
    // 删除用户
    async deleteArt(id) {
      this.$confirm({
        title: '确定要删除该文章吗?',
        content: '一旦删除 无法修复',
        onOk: async () => {
          const res = await this.$http.delete(`article/${id}`)
          if (res.status !== 200) return this.$message.error(res.message)
          this.$message.success('删除成功')
          this.getArtList()
        },
        onCancel: () => {
          this.$message.info('已取消删除')
        }
      })
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
    CateChange(value) {
      this.getCateAet(value)
    },
    async getCateAet(id) {
      const { data: res } = await this.$http.get(`article/cate/${id}`)
      if (res.status !== 200) return this.$message.error(res.message)
      console.log(res.data)
      this.Artlist = res.data
      this.pagination.total = res.total
    }
  }
}
</script>

<style scoped>
.actionSlot {
  display: flex;
  justify-content: center;
}
.artImg {
  width: 100px;
  height: 80px;
}
</style>

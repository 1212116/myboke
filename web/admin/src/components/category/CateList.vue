<template>
  <div>
    <h3>分类列表页面</h3>
    <a-card>
      <a-row>
        <a-col :span="4">
          <a-button type="primary" style="margin-left: 10px" @click="addCateVisible = true">新增分类</a-button>
        </a-col>
      </a-row>

      <a-table
        rowKey="id"
        :columns="columns"
        :pagination="pagination"
        :dataSource="Catelist"
        bordered
        @change="handleTableChange"
      >
        <template slot="action" slot-scope="data">
          <div class="actionSlot">
            <a-button type="primary" icon="edit" style="margin-right: 15px" @click="editCate(data.id)">编辑</a-button>
            <a-button type="danger" icon="delete" style="margin-right: 15px" @click="deleteCate(data.id)"
              >删除</a-button
            >
          </div>
        </template>
      </a-table>
    </a-card>

    <!-- 新增分类区域 -->
    <a-modal
      width="60%"
      closable
      title="新增分类"
      :visible="addCateVisible"
      @ok="addCateOk"
      @cancel="addCateCancel"
      destroyOnClose
    >
      <a-form-model :model="newCate" :rules="addCateRules" ref="addCateRef">
        <a-form-model-item has-feedback label="分类名称" prop="name">
          <a-input v-model="newCate.name"></a-input>
        </a-form-model-item>
      </a-form-model>
    </a-modal>
    <!-- 编辑分类区域 -->
    <a-modal width="60%" closable title="编辑分类" :visible="editCateVisible" @ok="editCateOk" @cancel="editCateCancel">
      <a-form-model :model="CateInfo" :rules="CateRules" ref="editCateRef">
        <a-form-model-item has-feedback label="分类名称" prop="name">
          <a-input v-model="CateInfo.name"></a-input>
        </a-form-model-item>
      </a-form-model>
    </a-modal>
  </div>
</template>

<script>
const columns = [
  {
    title: 'ID',
    dataIndex: 'id',
    width: '10%',
    key: 'id',
    align: 'center'
  },
  {
    title: '分类名',
    dataIndex: 'name',
    width: '20%',
    key: 'name',
    align: 'center'
  },
  {
    title: '操作',
    width: '30%',
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
      Catelist: [],
      columns,
      queryParam: {
        pagesize: 5,
        pagenum: 1
      },
      CateInfo: {
        name: '',
        id: 0
      },
      newCate: {
        name: ''
      },
      addCateVisible: false,
      editCateVisible: false,
      CateRules: {
        name: [
          {
            validator: (rule, value, callback) => {
              if (this.CateInfo.name === '') {
                callback(new Error('请输入分类名'))
              } else {
                callback()
              }
            },
            trigger: 'blur'
          }
        ]
      },
      addCateRules: {
        name: [
          {
            validator: (rule, value, callback) => {
              if (this.newCate.name === '') {
                callback(new Error('请输入分类名'))
              } else {
                callback()
              }
            },
            trigger: 'blur'
          }
        ]
      }
    }
  },
  created() {
    this.getCateList()
  },
  methods: {
    // 查询分类列表
    async getCateList() {
      const { data: res } = await this.$http.get('category', {
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
      this.Catelist = res.data
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
      this.getCateList()
    },
    // 删除分类
    async deleteCate(id) {
      this.$confirm({
        title: '确定要删除该分类吗?',
        content: '一旦删除 无法修复',
        onOk: async () => {
          const res = await this.$http.delete(`category/${id}`)
          if (res.status !== 200) return this.$message.error(res.message)
          this.$message.success('删除成功')
          this.getCateList()
        },
        onCancel: () => {
          this.$message.info('已取消删除')
        }
      })
    },
    // 新增分类
    addCateOk() {
      this.$refs.addCateRef.validate(async (valid) => {
        if (!valid) return this.$message.error('参数不符合要求，请重新输入')
        console.log(this.newCate)
        const { data: res } = await this.$http.post('category/add', {
          name: this.newCate.name
        })
        if (res.status !== 200) return this.$message.error(res.message)
        this.$message.success('添加分类成功')
        this.addCateVisible = false
        this.$refs.addCateRef.resetFields()
        await this.getCateList()
      })
    },
    addCateCancel() {
      this.$refs.addCateRef.resetFields()
      this.addCateVisible = false
      this.$message.info('新增分类已取消')
    },
    // 编辑用户
    async editCate(id) {
      this.editCateVisible = true
      const { data: res } = await this.$http.get(`category/${id}`)
      this.CateInfo = res.data
      this.CateInfo.id = id
    },
    editCateOk() {
      this.$refs.editCateRef.validate(async (valid) => {
        if (!valid) return this.$message.error('参数不符合要求，请重新输入')
        const { data: res } = await this.$http.put(`category/${this.CateInfo.id}`, {
          name: this.CateInfo.name
        })
        if (res.status !== 200) return this.$message.error(res.message)
        this.$message.success('更新分类信息成功')
        this.editCateVisible = false
        this.getCateList()
      })
    },
    editCateCancel() {
      this.editCateVisible = false
      this.$message.info('编辑分类已取消')
    }
  }
}
</script>

<style scoped>
.actionSlot {
  display: flex;
  justify-content: center;
}
</style>

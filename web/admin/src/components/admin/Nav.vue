<template>
  <a-layout-sider breakpoint="lg" v-model="collapsed">
    <div class="log">
      <span>{{ collapsed ? '博客' : '我的博客' }}</span>
    </div>
    <a-menu theme="dark" mode="inline" @click="goToPage">
      <a-menu-item key="index"> <a-icon type="dashboard"></a-icon><span>仪表盘</span> </a-menu-item>
      <a-sub-menu>
        <span slot="title"><a-icon type="file" /><span>文章管理</span></span>
        <a-menu-item key="addart"> <a-icon type="plus" /><span>写文章</span> </a-menu-item>
        <a-menu-item key="artlist"> <a-icon type="menu-unfold" /><span>文章列表</span> </a-menu-item>
      </a-sub-menu>
      <a-menu-item key="catelist"> <a-icon type="unordered-list" /><span>分类列表</span> </a-menu-item>
      <a-menu-item key="userlist"> <a-icon type="user" /><span>用户列表</span> </a-menu-item>
      <a-menu-item key="profile"> <a-icon type="setting" /><span>个人设置</span> </a-menu-item>
    </a-menu>
  </a-layout-sider>
</template>

<script>
export default {
  data() {
    return {
      collapsed: false
    }
  },
  methods: {
    goToPage(item) {
      this.$router.push('/' + item.key).catch((err) => err)
    }
  }
}
</script>
<style>
.log {
  height: 32px;
  margin: 16px;
  background-color: white;
  display: flex;
  justify-content: center;
  font-size: 20px;
}
</style>

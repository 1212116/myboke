<template>
  <div>
    <div class="d-flex justify-center pa-3 text-h4 font-weight-bold">
      {{ artInfo.title }}
    </div>
    <v-divider class="pa-3 ma-3"></v-divider>
    <v-alert class="ma-3" elevation="1" border="left" color="indigo" dark  outlined>{{ artInfo.desc }}</v-alert>
    <div class="ma-5">{{artInfo.content}}</div>
  </div>
</template>

<script>
export default {
  props: ['id'],
  data() {
    return {
      artInfo: []
    }
  },
  created() {
    this.getArtInfo()
  },
  methods: {
    // 查询文章
    async getArtInfo() {
      const { data: res } = await this.$http.get(`article/info/${this.id}`)
      this.artInfo = res.data
    }
  }
}
</script>

<style>
</style>

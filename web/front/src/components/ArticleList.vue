<template>
  <v-col>
    <v-card
      class="ma-3"
      v-for="item in artList"
      :key="item.key"
      link
      @click="$router.push(`detail/${item.ID}`)"
    >
      <v-row no-gutters>
        <v-col class="d-flex justify-center align-center mx-3" cols="1">
          <v-img max-height="100" max-width="100" :src="item.img"></v-img>
        </v-col>
        <v-col>
          <v-card-title class="ma-2"
            ><v-chip color="primary" label class="mr-2 white--text">{{
              item.Category.name
            }}</v-chip>
            {{ item.title }}
          </v-card-title>
          <v-card-subtitle v-text="item.desc"></v-card-subtitle>
          <v-divider></v-divider>
          <v-card-text>
            <v-icon color="blue darken-2">{{ 'mdi-airplane-check ' }}</v-icon>
          </v-card-text>
        </v-col>
      </v-row>
    </v-card>
    <div class="text-center">
      <v-pagination
        :total-visible="5"
        v-model="queryParam.pagenum"
        :length="Math.ceil(this.total / queryParam.pagesize)"
        @input="getArtList"
      ></v-pagination>
    </div>
  </v-col>
</template>

<script>
export default {
  data() {
    return {
      artList: [],
      queryParam: {
        pagesize: 5,
        pagenum: 1
      },
      total: 0
    }
  },
  created() {
    this.getArtList()
  },
  methods: {
    // 获取文章列表
    async getArtList() {
      const { data: res } = await this.$http.get('/articles', {
        params: {
          pagesize: this.queryParam.pagesize,
          pagenum: this.queryParam.pagenum
        }
      })
      this.artList = res.data
      this.total = res.total
    }
  }
}
</script>

<style>
</style>

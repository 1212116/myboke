<template>
  <v-card class="mx-auto" max-width="300">
    <v-img :src="profileInfo.img">
      <v-card-title>
        <v-col style="text-align: center">
          <v-avatar size="130" color="white">
            <img :src="profileInfo.avatar" alt="" />
          </v-avatar>
          <div class="ma-4 white--text">{{ profileInfo.name }}</div>
        </v-col>
      </v-card-title>
      <v-divider color="indigo"></v-divider>
    </v-img>

    <v-col>
      <v-card-title>About Me:</v-card-title>
      <v-card-text>{{ profileInfo.desc }}</v-card-text>
    </v-col>
    <v-divider color="indigo"></v-divider>
    <v-list nav dense>
      <v-list-item>
        <v-list-item-icon>
          <v-icon blue color="blue darken-2">{{ 'mdi-qqchat' }}</v-icon>
        </v-list-item-icon>
        <v-list-item-content> {{ profileInfo.qq_chat }} </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-icon>
          <v-icon color="green darken-2">{{ 'mdi-wechat' }}</v-icon>
        </v-list-item-icon>
        <v-list-item-content> {{ profileInfo.wechat }} </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-icon>
          <v-icon color="orange darken-2">{{ 'mdi-sina-weibo' }}</v-icon>
        </v-list-item-icon>
        <v-list-item-content> {{ profileInfo.weibo }} </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-icon>
          <v-icon color="primary">{{ 'mdi-youtube' }}</v-icon>
        </v-list-item-icon>
        <v-list-item-content> {{ profileInfo.bili }} </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-icon>
          <v-icon color="indigo">{{ 'mdi-email' }}</v-icon>
        </v-list-item-icon>
        <v-list-item-content> {{ profileInfo.email }} </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      profileInfo: {
        id: 1
      }
    }
  },
  created() {
    this.getProfileInfo()
  },
  methods: {
    // 获取个人信息
    async getProfileInfo() {
      const { data: res } = await this.$http.get(
        `profile/${this.profileInfo.id}`
      )
      if (res.status !== 200) return this.$message.error(res.message)
      this.profileInfo = res.data
    }
  }
}
</script>

<style>
</style>

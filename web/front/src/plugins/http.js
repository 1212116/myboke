import Vue from 'vue'
import axios from 'axios'

axios.defaults.baseURL = 'http://124.220.15.217:3000/api/v1'
Vue.prototype.$http = axios

import Vue from 'vue'
import App from './App.vue'
import SmartTable from 'vuejs-smart-table'
 
Vue.use(SmartTable)

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')

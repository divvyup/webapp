// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

// Pull in our bulma css
import Buefy from 'buefy'
import 'buefy/lib/buefy.css'

import VueResource from 'vue-resource'
Vue.use(VueResource)

Vue.config.productionTip = false
Vue.http.options.credentials = true

Vue.use(Buefy)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

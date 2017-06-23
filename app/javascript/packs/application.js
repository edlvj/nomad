import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResourse from 'vue-resource'
import Vuex from 'vuex'
import Materials from 'vue-materials'
import VueI18n from 'vue-i18n'

import Routes from './routes'
import App from '../components/app.vue'

import Stores from './stores'
import Translate from './translation'
const { env } = require('process')

Vue.use(VueResourse);
Vue.use(VueRouter);
Vue.use(Vuex);
Vue.use(Materials);
Vue.use(VueI18n);

const store = new Vuex.Store(Stores);

const router = new VueRouter({
  hashbang: false,
  mode: 'history',
  linkActiveClass: "active",
  routes: Routes    
})

const i18n = new VueI18n({
  locale: 'ua', 
  messages: Translate, 
}) 

Vue.http.options.root = env.NODE_ENV == 'production' ? '' : 'http://bezviz-edlvj.c9users.io/api/v1'

Vue.http.interceptors.push(function(request, next) {
  if(localStorage.access_token) {
      var tokens = JSON.parse(localStorage.access_token);
      request.headers.set('access-token', tokens.auth_token);
      request.headers.set('client', tokens.client_id);
      request.headers.set('uid',  tokens.uid);
      request.headers.set('expiry', tokens.expiry.toString());
  } 
  next();
});

Vue.prototype.$check = localStorage.access_token ? true : false


document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'));
  const app = new Vue({
    el: 'app',
    template: '<app/>',
    render: h => h(App),
    router: router,
    store: store,
    i18n: i18n,
  })
})


/*
router.beforeEach(function (transition) {
    if (transition.meta.auth && !auth.check()) {
      Materialize.toast('Please Login')
    } else {
      transition.next()
    }
})
*/








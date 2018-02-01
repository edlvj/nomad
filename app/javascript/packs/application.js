import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResourse from 'vue-resource'
import Materials from 'vue-materials'
import VueI18n from 'vue-i18n'

import Routes from './routes'
import App from './components/app.vue'

import Translate from './translation'

import { ApolloClient, createNetworkInterface } from 'apollo-client'
import VueApollo from 'vue-apollo'
import Auth from './services/auth'

const root_url = process.env.NODE_ENV == 'development' ? 'http://localhost:5000' : 'https://nomad-ua.herokuapp.com'

const networkInterface = createNetworkInterface({
  uri: root_url + '/graphql',
  transportBatching: true,
});

//need for graphql
networkInterface.use([{
  applyMiddleware(req, next) {
    if (!req.options.headers) {
      req.options.headers = {};  
    }
    
    if(localStorage.access_token) {
      var tokens = JSON.parse(localStorage.access_token);
      req.options.headers['access-token'] = tokens.auth_token;
      req.options.headers['client'] = tokens.client_id;
      req.options.headers['uid'] =  tokens.uid;
      req.options.headers['expiry'] = tokens.expiry.toString();
    } 
    next();
  }
}]);

const apolloClient = new ApolloClient({
  networkInterface: networkInterface,
  connectToDevTools: true,
})

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
})

Vue.use(VueApollo)
Vue.use(VueResourse);
Vue.use(VueRouter);
Vue.use(Materials);
Vue.use(VueI18n);

const router = new VueRouter({
  hashbang: false,
  mode: 'history',
  linkActiveClass: "active",
  routes: Routes    
})

const i18n = new VueI18n({
  locale: localStorage.lang ? localStorage.lang : 'ua', 
  messages: Translate, 
});

Vue.prototype.$auth = Auth
Vue.prototype.$fb_client = process.env.NODE_ENV == 'development' ? '1325792587499156' : '1896678157266601' 

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'));
  const app = new Vue({
    el: 'app',
    template: '<app/>',
    render: h => h(App),
    router: router,
    i18n: i18n,
    apolloProvider,
  })
})


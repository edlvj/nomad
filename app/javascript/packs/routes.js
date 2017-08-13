import indexCity from '../components/city/indexCity.vue'
import showCity from '../components/city/showCity.vue'
import newTopic from '../components/forum/newTopic.vue'
import showTopic from '../components/forum/showTopic.vue'
import showUser from '../components/user/showUser.vue'

export default [
    { path: '/', component: indexCity },
    { path: '/city/:id', component: showCity, name: 'city' },
    { path: '/city/:city_id/topic/new', component: newTopic },
    { path: '/topic/:id', component: showTopic },
    { path: '/user/:id', component: showUser, name: 'user' }, 
    { path: '*', redirect: '/' }
]
import cityList from '../components/cityList.vue'
import cityPage from '../components/cityPage.vue'
import newTopic from '../components/forum/newTopic.vue'
import showTopic from '../components/forum/showTopic.vue'
import showUser from '../components/user/showUser.vue'

export default [
    { path: '/', component: cityList },
    { path: '/city/:id', component: cityPage, name: 'city' },
    { path: '/city/:city_id/topic/new', component: newTopic },
    { path: '/topic/:id', component: showTopic },
    { path: '/user/:id', component: showUser, name: 'user' }, 
    { path: '*', redirect: '/' }
]
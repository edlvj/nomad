<template>
  <div id='app'>
    <app-navbar></app-navbar>
    <router-view></router-view>
  </div>
</template>

<script>
import Navbar from './layout/navbar.vue'

export default {
  components: {
    'app-navbar': Navbar, 
  }
}
</script>
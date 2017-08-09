<template>
<div class="container" v-if="user">
    <div id="profile-page" class="section">
            <div id="profile-page-header" class="card">
                <div class="card-image waves-effect waves-block waves-light" style="height: 250px;">
                    <img class="activator" src="/user/bg.jpg" alt="user background">                    
                </div>
                <figure class="card-profile-image">
                    <img :src="user.image"  alt="profile image" class="circle z-depth-2 responsive-img activator">
                </figure>
                <div class="card-content">
                  <div class="row">                    
                    <div class="col s2 offset-s2" >                        
                        <h4 class="card-title grey-text text-darken-4">{{ user.nickname }}</h4>                   
                    </div>
                    <div class="col s4 center-align">
                        <h4 class="card-title grey-text text-darken-4">{{ user.visited }}</h4>
                        <p class="medium-small grey-text">{{ $t("user.visit") }}</p>                        
                    </div>
                    <div class="col s4 center-align">
                        <h4 class="card-title grey-text text-darken-4">{{ user.visit }}</h4>
                        <p class="medium-small grey-text">{{ $t("user.want_visit") }}</p>                        
                    </div>                    
                  
                  </div>
                </div>
            </div>
          <!--  <favorite-table v-bind:favorites="user.favorite" ></favorite-table> -->
            <div class="row">  
            <div class="col s12 center-align">
               <gmap-map :center="{lat:31.9670512, lng:1.800903}" :zoom="2" :scrollwheel="false" style="width: 100%; height: 500px; position: relative;">
                   <gmap-marker :key="index" v-for="(m, index) in user.favorite" :position="m.position" :icon="{url: m.visited ? '/icons/visited.png' : '/icons/want_visit.png' }" :clickable="true" :draggable="true"></gmap-marker>
               </gmap-map>
               </div>
            </div>
    </div>
</div>
    
</template>

<script>

import Vue from 'vue'
const VueGoogleMaps = require('vue2-google-maps');

document.addEventListener('DOMContentLoaded', function() {
Vue.use(VueGoogleMaps, {
    load: {
        key: 'AIzaSyAt2nD_5eR_4G02pOEkLXv33U-ByNcVPzQ',
        v: '3',
        libraries: 'places'
      }
    })
});

import favoriteTable from './favoriteTable.vue'
import { user } from '../../graphql/queries.js'

export default {
 data () {
    return {
      id: this.$route.params.id,
    }
  },
  components: {
    favoriteTable  
  },
  apollo:{
    user: {
      query: user,
      variables () {
        return { id: this.$route.params.id }
      }
    },
  },  
}    
</script>
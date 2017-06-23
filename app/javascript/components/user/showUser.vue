<template>
<div class="container">
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
            <favorite-table v-bind:favorites="user.favorite" ></favorite-table>
    </div>
</div>
    
</template>

<script>
import favoriteTable from './favoriteTable.vue'

export default {
 data () {
    return {
      id: this.$route.params.id,
    }
  },
  components: {
    favoriteTable  
  },
  computed: {
    user: function () {
      return this.$store.getters.user;
    },
  },
  created: function() {
     this.$store.dispatch('getUser', this);
  },
}    
</script>
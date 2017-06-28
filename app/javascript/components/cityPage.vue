<template>
<div>
  <div class="section padd" :style="{ 'background-image': 'url(' + item.image.image.url  + ')' }">
    <div class="container">
        <h1 class="text_h center">
            <span><b class="white-text">{{ item.title }}</b></span> 
        </h1>
		<div class="center-align">
		  <a class="waves-effect waves-light btn-large cyan lighten-2" @click="to_visit(false)"><i class="material-icons left">query_builder</i>{{ $t('city.want_visit') }}</a>
		  <a class="waves-effect waves-light btn-large orange lighten-1" @click="to_visit(true)" ><i class="material-icons left">done</i>{{ $t('city.visited') }}</a>
		</div>
    </div>
  </div>
  <div class="row">
    <div class="col s12">
      <v-tabs>
        <v-tab class="s3" target="#rating">{{ $t('message.rating') }}</v-tab>
        <v-tab class="s2" target="#traveler">{{ $t('message.traveler') }}</v-tab>
        <v-tab class="s2" target="#prices">{{ $t('message.prices') }}</v-tab>
        <v-tab class="s2" target="#excursion">{{ $t('message.excursion') }}</v-tab>
        <v-tab class="s3" target="#forum">{{ $t('message.forum') }}</v-tab>
      </v-tabs>
    </div>
  </div>
  <rating-tab v-bind:rate="item.rating" ></rating-tab>
  <traveler-tab v-bind:travel="item.traveler"></traveler-tab>
  <price-tab v-bind:price="item.price"></price-tab>
  <forum-tab v-bind:topics="item.topic" v-bind:city_id="id"></forum-tab>
  <excursion-tab v-bind:excursions="item.excursions" ></excursion-tab>
</div>  
</template>

<script>

import ratingTab from './tabs/ratingTab.vue'
import travelerTab from './tabs/travelerTab.vue'
import priceTab from './tabs/priceTab.vue'
import excursionTab from './tabs/excursionTab.vue'
import forumTab from './tabs/forumTab.vue'

export default {
  data () {
    return {
      id: this.$route.params.id,
      visited: '',
    }
  },
  computed: {
    item: function () {
      return this.$store.getters.city;
    },
  },
  components: {
   ratingTab, 
   travelerTab,
   priceTab,
   forumTab,
   excursionTab, 
  },
  created: function() {
   this.$store.dispatch('getCity', this);
  },
  methods: {
    to_visit(type) {
      if(this.$check) {
        this.visited = type;
        this.$store.dispatch('setFavorite', this);
      } else {
        this.$dialog("Please login");
      }
    },
  }
}
</script>
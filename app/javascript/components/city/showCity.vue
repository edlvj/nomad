<template>
<div v-if="city">
  <div class="section padd" :style="{ 'background-image': 'url(' + city.image  + ')' }">
    <div class="container">
        <h1 class="text_h center">
            <span><b class="white-text">{{ city.title }}</b></span> 
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
        <v-tab class="s3" target="#rating" >{{ $t('message.rating') }}</v-tab>
        <v-tab class="s2" @click.native="travelerTab()" target="#traveler">{{ $t('message.traveler') }}</v-tab>
        <v-tab class="s2" @click.native="priceTab()" target="#prices">{{ $t('message.prices') }}</v-tab>
        <v-tab class="s2" @click.native="excursionTab()" target="#excursion">{{ $t('message.excursion') }}</v-tab>
        <v-tab class="s3" target="#forum">{{ $t('message.forum') }}</v-tab>
      </v-tabs>
    </div>
  </div>
  <rating-tab v-bind:rate="city.rating" v:if="city.rating"></rating-tab>
  <traveler-tab v-bind:travel="city_traveler"></traveler-tab>
  <price-tab v-bind:price="city_price" v_if="city_price"></price-tab>
  <forum-tab v-bind:topics="city.topics" v-bind:city_id="id"></forum-tab>
  <excursion-tab v-bind:excursions="city_excursion" ></excursion-tab>
</div>  
</template>

<script>

import { city } from '../../graphql/queries.js'
import { cityPrice } from '../../graphql/queries.js'
import { cityTraveler } from '../../graphql/queries.js'
import { cityExcursion } from '../../graphql/queries.js'
import { addFavorite } from '../../graphql/mutations.js'

import ratingTab from '../tabs/ratingTab.vue'
import travelerTab from '../tabs/travelerTab.vue'
import priceTab from '../tabs/priceTab.vue'
import excursionTab from '../tabs/excursionTab.vue'
import forumTab from '../tabs/forumTab.vue'

export default {
  data () {
    return {
      id: this.$route.params.id,
      visited: '',
      city_price: {
        airbnb: {
          url: ''
        }, 
        meal: {
          url: ''
        },
      },
      city_excursion: {},
      city_traveler: { 
        couchsurf: {
          hosts: '0',
          url: '',
        },  
      },
    }
  },
  apollo:{
    city: {
      query: city,
      variables () {
        return { id: this.$route.params.id }
      }
    },
  },
  components: {
   ratingTab, 
   travelerTab,
   priceTab,
   forumTab,
   excursionTab, 
  },
  methods: {
    priceTab() {
      this.$apollo.query({
        query: cityPrice,
        variables: {
          id: this.$route.params.id
        }
      }).then(data => {
        this.city_price = data.data.city_price;
      });
    },
    travelerTab() {
      this.$apollo.query({
        query: cityTraveler,
        variables: {
          id: this.$route.params.id
        }
      }).then(data => {
        this.city_traveler = data.data.city_traveler;
      });
    },
    excursionTab() {
      this.$apollo.query({
        query: cityExcursion,
        variables: {
          id: this.$route.params.id
        }
      }).then(data => {
        this.city_excursion = data.data.city_excursions;
      });
    },
    to_visit(type) {
      if(!this.$check) 
        return this.$dialog(this.$t('message.please_login'));
      
      this.$apollo.mutate({
        mutation: addFavorite,
        variables: {
          city_id: this.id,
          visited: type,  
        },
      }).then(data => {
        this.$dialog(this.$t('favorite.added'));
      });
      
    },
  }
}
</script>
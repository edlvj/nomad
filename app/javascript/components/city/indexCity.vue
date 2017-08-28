<template>
  <div id="city_list">
    <search-bar v-model="cities"></search-bar>
    <div class="section scrollspy">
      <v-container>
        <v-row>
        <city-item v-for="item in results" v-bind:item="item" :key="item.id"></city-item> 
        </v-row>
      </v-container>
      <infinite-loading :on-infinite="onInfinite" ref="infiniteLoading"></infinite-loading>
    </div>
  </div>
</template>

<script>
import InfiniteLoading from 'vue-infinite-loading'
import searchBar from '../layout/searchBar.vue'
import cityItem from '../city/_city.vue'
import gql from 'graphql-tag'

import { cities } from '../../graphql/queries.js'


export default {
  data: () => ({
      results: [],
      temp_count: 0,
      per_page: 12,
      cities: [],
  }),
  components: {
    searchBar, 
    cityItem,
    InfiniteLoading,
  },
  apollo:{
    cities: {
      query: cities,
    }
  },
  watch: {
    cities: function (val) {
     this.results = [];
     this.temp_count = 0;
     this.onInfinite();
    },
  },  
  methods: {
    onInfinite() {
     
     setTimeout(() => {
          if(this.cities.length <= this.per_page) {
            this.results = this.cities;
            return this.$refs.infiniteLoading.$emit('$InfiniteLoading:complete');
          }
          
          for (let i = this.temp_count; i < this.temp_count + this.per_page; i++) {
            if(this.cities.length > i) { 
              this.results.push(this.cities[i]);
            } else {
              return this.$refs.infiniteLoading.$emit('$InfiniteLoading:complete');
            }  
          }
        this.temp_count += this.per_page;
        this.$refs.infiniteLoading.$emit('$InfiniteLoading:loaded');
      }, 1000); 
    },
    replace_cities(city) {
      console.log(city);
    }
    
  },
  
}
</script>
<template>
  <div id="city_list">
    <search-bar></search-bar>
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
import searchBar from './searchBar.vue'
import cityItem from './cityItem.vue'

export default {
  data() {
    return {
      results: [],
      temp_count: 0,
    };
  },
  components: {
    searchBar, 
    cityItem,
    InfiniteLoading,
  },
  computed: {
    list: function () {
      return this.$store.getters.cities;
    },
  },
  created: function () {
    this.$store.dispatch('all', this);
  },
  watch: {
    list: function (val) {
     //fix № 1
     this.results = [];
     this.temp_count = 0;
     this.onInfinite();
    },
  },  
  methods: {
    onInfinite() {
     
     setTimeout(() => {
          for (let i = this.temp_count; i < this.temp_count + 12; i++) {
            if(this.list.length > i) { 
              this.results.push(this.list[i]);
            } else {
              return this.$refs.infiniteLoading.$emit('$InfiniteLoading:complete');
            }  
          }
        this.temp_count += 12;
        this.$refs.infiniteLoading.$emit('$InfiniteLoading:loaded');
      }, 1000); 
    },
    
  },
  
}
</script>
<template>
<div id="index-banner">
    <v-container>
        <div class="nav-wrapper">
            <div class="input-field">
              <input id="search" type="search" required v-model="query" v-on:keyup.13="search">
              <label class="label-icon" for="search"><i class="material-icons">search</i></label>
              <i class="material-icons">close</i>
            </div>
        </div>
    </v-container>
</div>

</template>

<script>
import { cities } from '../../graphql/queries.js'

export default {
  props: ['value'],
  data() {
    return {
      query: ''
    }  
  },
  methods: {
    search() {
      this.$apollo.query({
        query: cities,
        variables: {
          search: this.query
        }
      }).then(data => {
        this.$emit('input', data.data.cities)
      });
    }
  },
 
}
</script>
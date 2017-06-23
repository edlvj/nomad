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
export default {
  data() {
    return {
      query: ''
    }  
  },
  methods: {
    search() {
      this.$store.dispatch('search', this);
    }
  },
 
}
</script>
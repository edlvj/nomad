<template>
<div class="container">
  <h4>{{ $t('topic.add') }}</h4>
  <div class="row">
    <form class="col s12"  v-on:submit.prevent="onSubmit">
      <div class="row">
        <div class="input-field col s12">
          <input id="title" v-model="topic.title" required>
        </div>
      </div>
	  <div class="row">
        <div class="input-field col s12">
          <textarea v-model="topic.text" class="materialize-textarea" required></textarea>
          <label for="textarea">{{ $t('topic.text') }}</label>
        </div>
      </div>
	  <v-btn type="submit" class="btn waves-effect waves-light">{{ $t('topic.create') }}</v-btn>
   </form>
  </div>     
</div>    
</template>

<script>
export default { 
  data() {
    return {
      topic: {
        title: '',
        text: '',
        city_id: this.$route.params.city_id,
      }
    };
  },
  methods: {
    onSubmit() {
      this.$store.dispatch('saveTopic', this);
    }
  }  
} 
</script>
<template>
<div class="container">
  <h4>{{ $t('topic.add') }}</h4>
  <div class="row">
    <form class="col s12"  v-on:submit.prevent="onSubmit">
      <div class="row">
        <div class="input-field col s12">
          <input id="title"   type="text" v-model="topic.title" required>
          <label for="title">{{ $t('topic.title') }}</label>
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
import { addTopic } from '../../graphql/mutations.js'

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
      this.$apollo.mutate({
        mutation: addTopic,
        variables: {
          title: this.topic.title,
          city_id: this.topic.city_id,
          text: this.topic.text,
        },
      }).then(data => {
        this.$dialog("Topic created");
        this.$router.push({path: '/topic/' + data.data.addTopic.topic.id})
      });
    }
  }  
} 
</script>
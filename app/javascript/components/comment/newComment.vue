<template>
<div class="row" id="comment_new">
    <form class="col s12" v-on:submit.prevent="onSubmit">
      <div class="row">
        <div class="input-field col s12">
          <textarea id="textarea1" class="materialize-textarea" v-model="text"></textarea>
          <label for="textarea1">{{ $t('comment.comment') }}</label></label>
        </div>
		   <button class="btn waves-effect waves-light" type="submit">{{ $t('comment.add') }}</button>
      </div>
    </form>	
</div>	
</template>

<script>
export default {
  props: ['topic_id'],
  data() {
    return {
      text: '',
    };
  },
  methods: {
    onSubmit() {
      this.$store.dispatch('saveComment', this);
    }
  }  
} 
</script>
<template>
<div class="container">
  <div class="row">
    <article>
	  <h3>{{ topic.title }}</h3>
	  <div class="chip">
        by {{ topic.user }} at {{ topic.created }}
      </div>
	  <div class="row">
		{{ topic.text }}
	  </div>
	</article>
  </div>
  <index-comment v-bind:comments="topic.comments" ></index-comment>
  <new-comment  v-bind:topic_id="topic.id" ></new-comment>
</div>  
</template>

<script>
import newComment from '../comment/newComment.vue'
import indexComment from '../comment/indexComment.vue'

export default {
  data() {
    return {
      id: this.$route.params.id,
    };
  },
  components: {
    newComment, 
    indexComment
  },
  computed: {
    topic: function () {
      return this.$store.getters.topic;
    },
  },
  mounted: function() {
    this.$store.dispatch('getTopic', this);
  },
} 
</script>
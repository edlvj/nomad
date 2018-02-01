<template>
<div class="row" id="comment_list">	  
  <ul class="collection" v-for="comment in comments" :key="comment.id">
	<li class="collection-item avatar">
	  <router-link  :to="{ name: 'user', params: { id: comment.user_id  }}">
	  	<img class="material-icons circle" :src="comment.user_image">
	  </router-link>
	  <p>{{ comment.text }}</p>
	  <div class="chip">
      added at {{ comment.created_at }}
      </div>
    </li>
  </ul>  
</div>
</template>

<script>
export default { 
	props: ['comments'], 
} 
</script>
<template>
<div id="forum" class="col s12">
 <ul class="collection" >
    <li class="center-align" v-if="topics.length == 0">{{ $t('tabs.forum.no_topic') }}</li>
    <li class="collection-item avatar" v-for="topic in topics" :key="topic.id">
      <img class="material-icons circle" :src="topic.user_image" >
      <router-link :to="'/topic/' + topic.id">
        <span class="title">{{ topic.title }}</span>
      </router-link>  
      <p>{{ topic.text }}
      </p>
    </li>
  </ul>	
  <div class="center-align" v-if="this.$auth.check()"> 
    <router-link  class="btn waves-effect waves-light" :to="'/city/' + this.city_id +'/topic/new'">Створити нову тему</router-link>
  </div>  
</div>    
</template>    
<script>
export default {
  props: ['topics', 'city_id'],
}    
</script>
<template>
    <div id="excursion" class="col s12">
      <div class="center-align" v-if="excursions.data == 0">{{ $t('tabs.forum.no_topic') }}</div>
      <div class="collection">
          <a v-for="exc in excursions.data" :key="exc.url" :href="exc.url" class="collection-item">{{ exc.title }}<span class="new badge">{{ exc.price }} USD</span></a>
       </div>
    	<div class="center-align">
    	  <a class="waves-effect waves-light btn center-align" :href="excursions.url" >{{ $t('message.show_all') }}</a>
        </div>
        
    </div>
</template>

<script>
export default {
  props: ['excursions'],
}    
</script>
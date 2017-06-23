<template>
<div id="rating" class="col s12">
    <table class="centered responsive-table">
        <tbody>
    	   <tr>
            <td>{{ $t('tabs.rating.quality_life') }}</td>
    		<td ><Rate :length="5" :value="rate.quality_life_avg" :name="quality_life" @afterRate="onAfterRate" ></Rate></td>
    		<td>{{ $t('tabs.rating.fun') }}</td>
    		<td><Rate :length="5" :value="rate.fun_avg" :name="fun" @afterRate="onAfterRate"></Rate></td>
           </tr>
    	   <tr>
            <td>{{ $t('tabs.rating.safe') }}</td>
    		<td><Rate :length="5" :value="rate.safe_avg" :name="safe" @afterRate="onAfterRate"></Rate></td>
    		<td>{{ $t('tabs.rating.toward') }}</td>
    		<td><Rate :length="5" :value="rate.toward_avg" :name="toward" @afterRate="onAfterRate"></Rate></td>
           </tr>
        </tbody>
    </table>
</div>
</template>

<script>
import Rate from '../utils/rate.vue'

export default {
    props: ['rate'],
    data() {
        return {
          city_id: this.$route.params.id,
          rating: 3,
          rate_type: '',
          quality_life: 'quality_life',
          fun: 'fun',
          safe: 'safe',
          toward: 'toward',
        }
  },
    components: {
       Rate
    },
    methods: {
        onAfterRate (rate, name) {
            this.rating = rate
            this.rate_type = name
            this.$store.dispatch('setRate', this);
        },
    } 
}    
</script>
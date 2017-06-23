<template>
    <div id="prices" class="col s12">
      <table class="centered responsive-table">
        <thead>  
        </thead>
        <tbody>
    	    <tr>
            <td>{{ $t('tabs.price.airbnb') }}</td>
    		    <td><a :href="price.airbnb.url ">{{ price.airbnb.price }} UAH</a></td>
    		    <td>{{ $t('tabs.price.meal') }}</td>
    		    <td><a :href="price.meal.url ">{{ price.meal.price }} </a></td>
          </tr>
    	    <tr>
            <td>{{ $t('tabs.price.fin_req') }}</td>
    		    <td>{{ price.fin_req }} EUR</td>
          </tr>
        </tbody>
      </table>
    </div>
</template>


<script>
export default {
  props: ['price'],
}    
</script>
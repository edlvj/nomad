<template>
<div id="traveler" class="col s12">
  <table class="centered responsive-table">
  <thead>  
  </thead>
  <tbody>
	  <tr>
      <td>{{ $t("tabs.traveler.region") }}</td>
		  <td>{{ $t("region." + travel.region ) }}</td>
		  <td>{{ $t('tabs.traveler.country')  }}</td>
		  <td>{{ travel.country }}</td>
    </tr>
	  <tr>
      <td>{{ $t('tabs.traveler.couchsurf')}}</td>
		  <td><a :href="travel.couchsurf.url ">{{ travel.couchsurf.hosts }}</a></td>
		  <td>{{ $t('tabs.traveler.insurance') }}</td>
		  <td><a href="https://insurance.tickets.ua/"><img src="/brands/tickets.png"></a></td>
    </tr>
    </tbody>
  </table>
</div>	
</template>

<script>
export default {
  props: ['travel'], 
}    
</script>
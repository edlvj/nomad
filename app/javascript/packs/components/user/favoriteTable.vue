<template>
<div id="profile-page-content" class="row">
    <div id="profile-page-sidebar" class="col s12 m12">
    <table>
		<thead>
		  <tr>
			  <th>{{ $t("message.city") }} </th>
			  <th>{{ $t("message.type") }}</th>
		  </tr>
		</thead>

		<tbody v-for="fave in favorites" :key="fave.id">
		  <tr>
			<td>{{ fave.city }}</td>
			<td v-if="fave.visited">{{ $t("user.visit") }}</td>
            <td v-else>{{ $t("user.want_visit") }}</td>
		  </tr>
		</tbody>
	</table>
    </div>
</div>
</template>

<script >
export default {
   props: ['favorites'], 
}
</script>>
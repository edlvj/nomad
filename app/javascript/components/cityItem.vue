<template>
    <v-grid s12 m4 l4>
        <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
                <img class="activator" :src="item.image.url" alt="city">
            </div>
            <div class="card-content">
                <span class="card-title activator grey-text text-darken-4"> {{ item.title }}<i class="mdi-navigation-more-vert right"></i></span>
                <p><router-link :to="{ name: 'city', params: { id: item.id }}">{{ $t('cities.show') }}</router-link></p>
            </div>
        </div>
    </v-grid>
</template>

<script>
export default {
    props: ['item']
}
</script>
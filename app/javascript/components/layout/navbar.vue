<template>
<div class="navbar-fixed">
    <v-dropdown id="dropdown">
        <li v-for="lang in langs">
            <a @click="changeLang(lang.key)">{{ lang.name }}</a>
        </li>
    </v-dropdown>
    <nav class="cyan lighten-2" role="navigation">
        <v-container>
          <div class="nav-wrapper">
            <a href="/"  class="brand-logo">Nomad</a>
      
            <a href="#" v-side-nav:mobile class="button-collapse"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li><a v-dropdown:dropdown>{{ $t('user.lang') }}<i class="material-icons right">arrow_drop_down</i></a></li>
                <li><a v-if="!logged" v-on:click="social('facebook')">{{ $t('user.fb_login') }}</a></li>
                <li><router-link  :to="{ name: 'user', params: { id: user_id  }}" v-if="logged">{{ $t('user.profile') }}</router-link></li>
                <li><a v-if="logged" v-on:click="logout()">{{ $t('user.exit') }}</a></li>
            </ul>
            <ul id="mobile" class="side-nav">
                <li><a v-if="!logged" v-on:click="social('facebook')">{{ $t('user.fb_login') }}</a></li>
                <li><router-link  :to="{ name: 'user', params: { id: user_id  }}" v-if="logged">{{ $t('user.profile') }}</router-link></li>
                <li><a v-if="logged" v-on:click="logout()">{{ $t('user.exit') }}</a></li>
            </ul>
          </div>
        </v-container>
    </nav>
</div>
</template>

<script>
export default {
    data() {
        return {
          auth: this.$auth,
          code: this.$route.query.code,
          provider: 'facebook',
          logged: this.$auth.check(),
          langs: [ 
            { key: 'en', name: 'English'},
            { key: 'ua', name: 'Українська'},
          ],
        };
    },
    mounted() {
      if (this.code) {
        this.$auth.login(this);
        this.$router.push('/');
        this.logged = true;
      }
    },
    computed: {
      user_id: function () {
        if(localStorage.user_id != undefined) {
          return localStorage.user_id;
        } else {
          return this.auth.user.id;
        }
      },
    },
    methods: {
      social(provider) {
        if(this.provider == 'facebook') {
            var host = new URL(window.location.href).host
            var redirect_uri = 'http://' + host;
            
            window.location = 'https://www.facebook.com/v2.5/dialog/oauth?client_id='+ this.$fb_client +'&redirect_uri='+ redirect_uri +'&response_type=code';  
        }
      },
      logout() {
        if(this.logged) {
            this.$auth.logout(this);
            this.logged = false;
        }
      },
      changeLang(lang) {
        let current = this.$i18n.locale;
        if (current != lang) {
          localStorage.setItem('lang', lang);
          this.$i18n.locale = lang;
        }
      },
    }
}    
</script>

<template>
<div class="navbar-fixed" id="nav_template">
    <nav class="cyan lighten-2" role="navigation">
        <v-container>
          <div class="nav-wrapper">
            <a href="/"  class="brand-logo">{{ $t('message.title') }}</a>
            <ul class="right hide-on-med-and-down">
                <li><a v-if="!auth" v-on:click="social('facebook')">{{ $t('user.fb_login') }}</a></li>
                <li><router-link  :to="{ name: 'user', params: { id: user_id  }}" v-if="auth">{{ $t('user.profile') }}</router-link></li>
                <li><a v-if="auth" v-on:click="logout()">{{ $t('user.exit') }}</a></li>
            </ul>
            <ul id="nav-mobile" class="side-nav">
                <li><a v-if="!auth" v-on:click="social('facebook')">{{ $t('user.fb_login') }}</a></li>
                <li><router-link  :to="{ name: 'user', params: { id: user_id  }}" v-if="auth">{{ $t('user.profile') }}</router-link></li>
                <li><a v-if="auth" v-on:click="logout()">{{ $t('user.exit') }}</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
          </div>
        </v-container>
    </nav>
</div>
</template>

<script>

export default {
    data() {
        return {
          user_id: localStorage.user_id || '',
          code: this.$route.query.code,
          provider: 'facebook',
          auth: this.$check
        };
    },
    mounted() {
      if (this.code) {
        this.$store.dispatch('login_social', this);
        this.auth = true;
      }
    },
    methods: {
      social(provider) {
        if(this.provider == 'facebook') {
            var host = new URL(window.location.href).hostname
            var redirect_uri = 'http://'  + host;
            window.location = 'https://www.facebook.com/v2.5/dialog/oauth?client_id='+ this.$fb_client +'&redirect_uri='+ redirect_uri +'&response_type=code';  
        }
      },
      logout() {
        this.$store.dispatch('logout', this);  
        this.auth = false;
      }
    }
}    
</script>
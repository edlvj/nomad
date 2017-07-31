<template>
<div class="navbar-fixed">
    <nav class="cyan lighten-2" role="navigation">
        <v-container>
          <div class="nav-wrapper">
            <a href="/"  class="brand-logo">Nomad</a>
            
            <a href="#" v-side-nav:mobile class="button-collapse"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li><a v-if="!auth" v-on:click="social('facebook')">{{ $t('user.fb_login') }}</a></li>
                <li><router-link  :to="{ name: 'user', params: { id: user_id  }}" v-if="auth">{{ $t('user.profile') }}</router-link></li>
                <li><a v-if="auth" v-on:click="logout()">{{ $t('user.exit') }}</a></li>
            </ul>
              <ul id="mobile" class="side-nav">
                  <li><a v-if="!auth" v-on:click="social('facebook')">{{ $t('user.fb_login') }}</a></li>
                  <li><router-link  :to="{ name: 'user', params: { id: user_id  }}" v-if="auth">{{ $t('user.profile') }}</router-link></li>
                  <li><a v-if="auth" v-on:click="logout()">{{ $t('user.exit') }}</a></li>
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
          code: this.$route.query.code,
          provider: 'facebook',
          auth: this.$check,
        };
    },
    mounted() {
      if (this.code) {
        this.$store.dispatch('login_social', this);
        this.$router.push('/');
        this.auth = true;
      }
    },
    computed: {
      user_id: function () {
        if(localStorage.length != 0) {
          return localStorage.user_id;
        } else {
          return this.$store.getters.user_id;
        }
      },
    },
    methods: {
      social(provider) {
        if(this.provider == 'facebook') {
            var host = new URL(window.location.href).hostname
            var redirect_uri = 'http://' + host;
            window.location = 'https://www.facebook.com/v2.5/dialog/oauth?client_id='+ this.$fb_client +'&redirect_uri='+ redirect_uri +'&response_type=code';  
        }
      },
      logout() {
        if(this.auth) {
          this.$store.dispatch('logout', this);  
          this.auth = false;
        }
      },
    }
}    
</script>

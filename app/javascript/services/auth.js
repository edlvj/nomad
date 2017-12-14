export default {
    authenticated: false,
    user: {},
    login(context, creds) {
        context.$http.get('/api/v1/custom/'+ context.provider +'/callback?code=' + context.code).then(response => {
            localStorage.setItem('access_token', JSON.stringify(response.data));
            localStorage.setItem('user_id', JSON.stringify(response.data.id));
            this.authenticated = true;
            this.user = response.data;
        });
    },
    logout: function(context) {
        
        context.$http.delete('/api/v1/auth/sign_out', {
            before(request) {
                if(localStorage.access_token) {
                    var tokens = JSON.parse(localStorage.access_token);
                    request.headers.set('access-token', tokens.auth_token);
                    request.headers.set('client', tokens.client_id);
                    request.headers.set('uid',  tokens.uid);
                    request.headers.set('expiry', tokens.expiry.toString());
                } 
            }
        }).then(response => {
            localStorage.removeItem('access_token');
            localStorage.removeItem('user_id');
            this.authenticated = false;
        });
    },
    check: function() {
        if(localStorage.access_token != undefined || this.authenticated) {
           return true;
        } else {
           return false;
        };
    },
    getUser: function() {
        return this.user;
    }
}
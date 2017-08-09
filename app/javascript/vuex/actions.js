export const login_social = ({ commit }, context ) => {
  context.$http.get('/api/v1/custom/'+ context.provider +'/callback?code=' + context.code).then(response => {
    localStorage.setItem('access_token', JSON.stringify(response.data));
    localStorage.setItem('user_id', JSON.stringify(response.data.id));
    commit('set', { type: 'user_id', items: response.data.id });
  });
}

export const logout = ({ commit }, context ) => {
  context.$http.delete('/api/v1/auth/sign_out').then(response => {
    localStorage.removeItem('access_token');
    localStorage.removeItem('user_id');
  });
}

import * as actions from './actions'
import * as getters from './getters'
import * as mutations from './mutations'

export default { 
  state: {
      cities: [],
      city: [],
      user: [],
      topic: []
  },
  getters,
  mutations,
  actions,
}
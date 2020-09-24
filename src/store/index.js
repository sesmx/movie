import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    apiRoot: process.env.VUE_APP_API
  },
  mutations: {},
  actions: {},
  modules: {}
});

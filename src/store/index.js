import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    apiRoot: process.env.VUE_APP_API,
    movies: [],
    nowshowing: [],
    upcoming: []
  },
  mutations: {
    /*addMovie(state, movie) {
      state.movies.push(movie);
    }*/
  },
  actions: {},
  modules: {}
});

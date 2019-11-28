import Vue from 'vue';
import Vuex from 'vuex';
import article from './modules/article';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    article
  }
});
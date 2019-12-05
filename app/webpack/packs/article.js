import Vue from 'vue';
import Articles from '../components/article/Articles.vue';
import Toasted from 'vue-toasted';

const options = {
  duration: 2000,
  type: 'success'
}

Vue.use(Toasted, options);

document.addEventListener('DOMContentLoaded', () => {
  const articles = new Vue({
    el: '#articles-vue',
    render: h => h(Articles)
  });
});
import Vue from 'vue';
import Articles from '../components/article/Articles.vue';

document.addEventListener('DOMContentLoaded', () => {
  const articles = new Vue({
    el: '#articles-vue',
    render: h => h(Articles)
  });
});
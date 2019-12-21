import Vue from 'vue';
import VueRouter from 'vue-router';
import CommentTop from '../components/comment/CommentTop.vue';
import Comments from '../components/comment/Comments.vue';
import NewCommentForm from '../components/comment/NewCommentForm.vue';
import Toasted from 'vue-toasted';

import store from '../store';

Vue.use(VueRouter);

const element = document.querySelector('#comments-vue');
const articleId = parseInt(element.dataset.articleId, 10);

const routes = [
  { path: "/", name: "comments", component: Comments, props: { articleId: articleId } },
  { path: "/new", name: "NewComment", component: NewCommentForm, props: { articleId: articleId } },
];
const router = new VueRouter({
  routes
});

const options = {
  duration: 2000,
  type: 'success'
}

Vue.use(Toasted, options);

document.addEventListener('DOMContentLoaded', () => {
  const comments = new Vue({
    el: '#comments-vue',
    router,
    store,
    render: h => h(CommentTop, {
      props: {
        articleId: articleId
      }
    })
  });
});
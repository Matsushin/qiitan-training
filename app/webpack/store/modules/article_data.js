const articlesObj = document.querySelector('#articles-vue');
const articles = articlesObj ? JSON.parse(articlesObj.dataset.articles) : [];

export default {
  articles
};
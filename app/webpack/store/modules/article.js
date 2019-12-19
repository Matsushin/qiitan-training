import axios from 'axios';

const state = {
    all: [],
    article: {
        tags: [],
        errors: []
    }
}

const getters = {
    allArticles: state => state.all,
    article(state) {
        return state.article
    },
}

const actions = {
    fetchArticles({ commit, state }, params) {
        axios.get(`/api/v1/articles`, { params: params })
            .then(response => {
                commit('receiveArticles', response.data);
            });
    },
    fetchArticle({ commit, state }, articleId) {
        axios.get(`/api/v1/articles/${articleId}`)
          .then(response => {
              commit('receiveArticle', response.data);
          });
    },
    async createArticle({ commit, state }, params) {
        await axios.post(`/api/v1/articles`, { article: params })
          .then(response => commit('receiveArticle', response.data))
          .catch(error => console.log(error.response.data.errors));
    },
    async updateArticle({ commit, state }, params) {
        await axios.patch(`/api/v1/articles/${params.id}`, { article: params })
          .then(response => {
              commit('receiveArticle', response.data);
          });
    },
    async deleteArticle({ commit, state }, articleId) {
        await axios.delete(`/api/v1/articles/${articleId}`)
          .then(response => {
              commit('receiveArticle', response.data);
          })
          .catch(response => console.log('error'));
    }
}

const mutations = {
    receiveArticles (state, data) {
        state.all = data;
    },
    receiveArticle (state, data) {
        state.article = data;
        if (!data.errors) {
            state.article.errors = []
        }
    }
}

export default {
    state,
    getters,
    actions,
    mutations
};
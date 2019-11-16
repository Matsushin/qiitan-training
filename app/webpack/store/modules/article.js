import axios from 'axios';

const state = {
    all: [],
    article: {
        tags: []
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
        axios.get(`/api/v1/articles/` + articleId)
          .then(response => {
              commit('receiveArticle', response.data);
          });
    },
}

const mutations = {
    receiveArticles (state, data) {
        state.all = data;
    },
    receiveArticle (state, data) {
        state.article = data;
    }
}

export default {
    state,
    getters,
    actions,
    mutations
};
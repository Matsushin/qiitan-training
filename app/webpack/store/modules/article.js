import axios from 'axios';

const state = {
    all: []
}

const getters = {
    allArticles: state => state.all
}

const actions = {
    fetchArticles({ commit, state }, params) {
        axios.get(`/api/v1/articles`, { params: params })
            .then(response => {
                commit('receiveArticles', response.data);
            });
    }
}

const mutations = {
    receiveArticles (state, data) {
        console.log(data)
    }
}

export default {
    state,
    getters,
    actions,
    mutations
};
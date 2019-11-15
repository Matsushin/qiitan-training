import axios from 'axios';

const state = {
    all: []
}

const getters = {
    allComments: state => state.all
}

const actions = {
    fetchComments({ commit, state }, params) {
        axios.get(`/api/v1/comments`, { params: params })
            .then(response => {
                commit('receiveComments', response.data);
            });
    }
}

const mutations = {
    receiveComments (state, data) {
        state.all = data;
    }
}

export default {
    state,
    getters,
    actions,
    mutations
};
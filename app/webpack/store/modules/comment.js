import axios from 'axios';
const state = {
    all: [],
    comment: {
        errors: []
    }
}

const getters = {
    comments: state => state.all,
    comment(state) {
        return state.comment
    },
}

const actions = {
    fetchComments({ commit, state }, articleId) {
        axios.get(`/api/v1/articles/${articleId}/comments`)
            .then(response => {
                commit('receiveComments', response.data);
            });
    },
    async createComment({ commit, state }, params) {
        await axios.post(`/api/v1/articles/${params.articleId}/comments`, { comment: params })
          .then(response => commit('receiveComment', response.data))
          .catch(error => console.log(error.response.data.errors));
    },
}

const mutations = {
    receiveComments (state, data) {
        state.all = data;
    },
    receiveComment (state, data) {
        state.comment = data;
        if (!data.errors) {
            state.comment.errors = []
        }
    }
}

export default {
    state,
    getters,
    actions,
    mutations
};
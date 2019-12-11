<template>
  <div>
    <div
      v-if="errors.length"
      class="notice-alert">
      <div class="alert alert-danger">
        <ul class="notice-inline">
          <li
            v-for="error in errors"
            :key="error.id">
            {{ error }}
          </li>
        </ul>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <h2>記事の編集</h2>
        <div class="box">
          <div class="box-body">
            <div class="form-group">
              <label>タイトル</label>
              <input
                class="form-control required"
                v-model="article.title"
                type="text"
              >
            </div>
            <div class="form-group">
              <label>本文</label>
              <textarea
                class="form-control required"
                v-model="article.body"
                type="text"
              />
            </div>
            <button
              class="btn btn-primary"
              @click="handleSubmit"
            >
              更新する
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex';

export default {
  props: {
    articleId: {
      type: Number
    },
  },
  data() {
    return {
      errors: []
    }
  },
  computed: {
    ...mapGetters({
      article: 'article',
    })
  },
  created () {
    this.$store.dispatch('fetchArticle', this.articleId)
  },
  methods: {
    async handleSubmit() {
      const endpoint = `/api/v1/articles/${this.articleId}`
      const res = await axios.patch(endpoint, this.article)
      if (res.data.errors) {
        this.errors = res.data.errors
      } else {
        location.href = '/vue/articles'
      }
    }
  }
}
</script>
<template>
  <div>
    <Errors :errors="errors" />
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
import Errors from '../../components/shared/Errors'

export default {
  components: {
    Errors
  },
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
    handleSubmit() {
      this.article.id = this.articleId
      this.$store.dispatch('updateArticle', this.article).then(() => {
        if (this.$store.getters.article.errors.length > 0) {
          this.errors = this.$store.getters.article.errors
        } else {
          location.href = '/vue/articles'
        }
      })
    }
  }
}
</script>
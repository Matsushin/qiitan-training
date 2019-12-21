<template>
  <div>
    <Errors :errors="errors" />
    <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <h2>記事「{{ article.title }}」コメントの登録</h2>
        <div class="box">
          <div class="box-body">
            <div class="form-group">
              <label>本文</label>
              <textarea
                class="form-control required"
                v-model="body"
                type="text"
              />
            </div>
            <submit-button
              class="btn btn-primary"
              @click="handleSubmit">
              登録する
            </submit-button>
            <router-link to="/" class="btn btn-default">戻る</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import Errors from '../../components/shared/Errors'
import SubmitButton from '../../components/shared/SubmitButton'

export default {
  components: {
    Errors,
    SubmitButton
  },
  props: {
    articleId: {
      type: Number
    },
  },
  computed: {
    ...mapGetters({
      article: 'article',
    }),
  },
  data() {
    return {
      body: '',
      errors: []
    }
  },
  created () {
    this.$store.dispatch('fetchArticle', this.articleId)
  },
  methods: {
    handleSubmit() {
      const params = {
        articleId: this.articleId,
        body: this.body
      }
      this.$store.dispatch('createComment', params).then(() => {
        if (this.$store.getters.comment.errors.length > 0) {
          this.errors = this.$store.getters.comment.errors
        } else {
          this.$router.push({path: "/", articleId: this.articleId})
          this.$toasted.show('コメントを登録しました');
        }
      })
    }
  }
}
</script>
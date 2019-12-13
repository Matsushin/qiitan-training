<template>
  <div>
    <Errors :errors="errors" />
    <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <h2>記事の登録</h2>
        <div class="box">
          <div class="box-body">
            <div class="form-group">
              <label>タイトル</label>
              <input
                class="form-control required"
                v-model="title"
                type="text"
              >
            </div>
            <div class="form-group">
              <label>本文</label>
              <textarea
                class="form-control required"
                v-model="body"
                type="text"
              />
            </div>
            <button
              class="btn btn-primary"
              @click="handleSubmit"
            >
              登録する
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Errors from '../../components/shared/Errors'

export default {
  components: {
    Errors
  },
  props: {
    userId: {
      type: Number
    },
  },
  data() {
    return {
      title: '',
      body: '',
      errors: []
    }
  },
  methods: {
    handleSubmit() {
      const params = {
        user_id: this.userId,
        title: this.title,
        body: this.body
      }
      this.$store.dispatch('createArticle', params).then(() => {
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
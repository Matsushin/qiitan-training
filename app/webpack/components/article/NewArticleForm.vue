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
import axios from 'axios';
export default {
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
    async handleSubmit() {
      const endpoint = '/api/v1/articles'
      const params = {
        article: {
          user_id: this.userId,
          title: this.title,
          body: this.body
        }
      }
      const res = await axios.post(endpoint, params)
      if (res.data.errors) {
        this.errors = res.data.errors
      } else {
        location.href = '/vue/articles'
      }
    }
  }
}
</script>
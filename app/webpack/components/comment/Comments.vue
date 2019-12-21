<template>
  <div class="row">
    <div class="col-xs-8 col-xs-offset-2">
      <h2>記事「{{ article.title }}」のコメント一覧</h2>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-body">
              <div class="pull-right">
                <router-link to="/new" class="btn btn-primary">コメントを追加</router-link>
              </div>
              <div v-if="comments.length > 0">
                <table class="table table-striped table-hover">
                  <thead>
                  <tr>
                    <th >ID</th>
                    <th>本文</th>
                    <th>作成日時</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for='comment in comments' :key="comment.id">
                    <td>{{ comment.id }}</td>
                    <td>{{ comment.body }}</td>
                    <td>{{ formatDatetime(comment.created_at) }}</td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div v-else >
                <p>コメントがありません</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import moment from 'moment';

export default {
  props: {
    articleId: {
      type: Number
    },
  },
  computed: {
    ...mapGetters({
      article: 'article',
      comments: 'comments',
    }),
  },
  created () {
    this.$store.dispatch('fetchArticle', this.articleId)
    this.$store.dispatch('fetchComments', this.articleId)
  },
  methods: {
    formatDatetime(datetime) {
      return moment(datetime).format("YYYY/MM/DD hh:mm:ss")
    }
  }
}
</script>
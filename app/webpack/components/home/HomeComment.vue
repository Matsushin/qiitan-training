<template>
  <div>
    <h3>{{ title }}</h3>
    <div class="box">
      <div v-if="comments.length > 0">
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>記事タイトル</th>
            <th>内容</th>
          </tr>
          </thead>
          <tbody>
          <tr v-for='comment in comments' :key="comment.id">
            <td>{{ comment.article.title }}</td>
            <td>{{ comment.body }}</td>
          </tr>
          </tbody>
        </table>
      </div>
      <div v-else >
        <p>コメント情報がありません</p>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  data() {
    return {
      title: 'ホーム',
    }
  },
  computed: {
    ...mapGetters({
      comments: 'allComments',
    }),
  },
  created () {
    this.$store.dispatch("fetchComments")
  }
}
</script>
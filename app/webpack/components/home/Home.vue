<template>
  <div>
    <h3>{{ title }}</h3>
    <div class="row">
      <div class="col-md-3">
        <div class="panel panel-default text-center">
          <div class="panel-heading">
            カウントアップ
          </div>
          <div class="panel-body">
            <p>合計カウント数：{{ totalCount }}</p>
            <span
              class="btn btn-primary"
              @click="countUp"
            >
              カウントアップする
            </span>
          </div>
        </div>
      </div>
      <div class="col-md-9">
        <div class="box">
          <div v-if="articles.length > 0">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>タイトル</th>
                <th>内容</th>
                <th>作成日</th>
                <th>コメント数</th>
                <th></th>
              </tr>
              </thead>
              <tbody>
              <tr v-for='article in articles' :key="article.id">
                <td>{{ article.title }}</td>
                <td>{{ article.short_body }}</td>
                <td>{{ article.created_on }}</td>
                <td>{{ article.comment_count }}</td>
                <td>
                <span
                        class="btn btn-primary"
                        @click="handleClick(article.title)"
                >
                  タイトルをアラート表示する
                </span>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
          <div v-else >
            <p>記事情報がありません</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  data() {
    return {
      title: '記事一覧',
      count: 0
    }
  },
  computed: {
    ...mapGetters({
      articles: 'allArticles',
    }),
    totalCount () {
      return `${this.count}回`
    }
  },
  created () {
    this.$store.dispatch("fetchArticles")
  },
  methods: {
    countUp() {
      this.count += 1
    },
    handleClick(title) {
      alert(`記事タイトル名は「${title}」です`)
    }
  }
}
</script>
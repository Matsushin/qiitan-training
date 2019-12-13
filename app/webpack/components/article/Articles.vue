<template>
  <div>
    <h2>記事一覧</h2>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-body">
            <div class="pull-right">
              <a href="articles/new" class="btn btn-primary">記事を追加</a>
            </div>
            <div v-if="articles.length > 0">
              <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th >記事ID</th>
                    <th>タイトル</th>
                    <th>内容</th>
                    <th>作成者</th>
                    <th>コメント数</th>
                    <th>作成日時</th>
                    <th></th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for='article in articles' :key="article.id">
                    <td>{{ article.id }}</td>
                    <td>{{ article.title }}</td>
                    <td>{{ article.short_body }}</td>
                    <td>{{ article.author_email }}</td>
                    <td>{{ article.comment_count }}</td>
                    <td>{{ formatDatetime(article.created_at) }}</td>
                    <td>
                      <a :href="`./articles/` + article.id + `/edit`">編集</a>
                    </td>
                    <td>
                      <a :href="`./articles/` + article.id">詳細</a>
                    </td>
                    <td>
                      <a href="#" @click="deleteArticle(article.id)">削除</a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div v-else >
              <p>記事がありません</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import articleData from '../../store/modules/article_data.js';
import moment from 'moment';

export default {
  data() {
    return {
      articles: articleData.articles
    }
  },
  methods: {
    formatDatetime(datetime) {
      return moment(datetime).format("YYYY/MM/DD hh:mm:ss")
    },
    async deleteArticle (articleId) {
      if(confirm(`記事ID:${articleId}の記事情報を本当に削除しますか？`)) {
        const endpoint = `/api/v1/articles/${articleId}`
        await axios.delete(endpoint, articleId)
        const res = await axios.get('/api/v1/articles')
        this.articles = res.data
        this.$toasted.show('削除しました');
      }
    }
  }
}
</script>
<template>
  <div>
    <h2>記事一覧</h2>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-body">
            <div v-if="articles.length > 0">
              <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th >記事ID</th>
                    <th>タイトル</th>
                    <th>内容</th>
                    <th>作成者</th>
                    <th>コメント数</th>
                    <th>作成日</th>
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
                    <td>{{ article.created_on }}</td>
                    <td>
                      <a :href="`./articles/` + article.id">詳細</a>
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
import articleData from '../../store/modules/article_data.js';
export default {
  data() {
    return {
      articles: articleData.articles
    }
  }
}
</script>
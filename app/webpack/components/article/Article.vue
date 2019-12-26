<template>
  <div>
    <h2>記事「{{ article.title }}」</h2>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-body">
            <dl class="dl-horizontal">
              <dt>ID</dt>
              <dd>{{ article.id }}</dd>
              <dt>タイトル</dt>
              <dd>{{ article.title }}</dd>
              <dt>本文</dt>
              <dd>{{ article.body }}</dd>
              <dt>作成者</dt>
              <dd>{{ article.author_email }}</dd>
              <dt>画像</dt>
              <dd>
                <image-viewer>
                  <img v-bind:src='article.image_url' class="article-image">
                </image-viewer>
              </dd>
              <dt>コメント数</dt>
              <dd>{{ article.comment_count }}</dd>
              <dt>タグ</dt>
              <dd>{{ tagNames }}</dd>
              <dt>作成日時</dt>
              <dd>{{ formatDatetime(article.created_at) }}</dd>
              <dt>更新日時</dt>
              <dd>{{ formatDatetime(article.updated_at) }}</dd>
            </dl>
            <a :href="`./${article.id}/comments`">コメント一覧を見る</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import moment from 'moment';
import ImageViewer from '../viewerjs/ImageViewer';

export default {
  components: {
    ImageViewer
  },
  computed: {
    ...mapGetters({
      article: 'article',
    }),
    tagNames() {
      if (this.article.tags.length > 0) {
        const names = this.article.tags.map((tag) => {
          return tag.name
        })
        return names.join(',')
      }
    }
  },
  created () {
    this.$store.dispatch('fetchArticle', location.href.split('/').pop())
  },
  methods: {
    formatDatetime(datetime) {
      return moment(datetime).format("YYYY/MM/DD hh:mm:ss")
    },
  }
}
</script>
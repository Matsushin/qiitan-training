<template>
  <div>
    <p>test</p>
    <p>{{ test }}</p>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {

  data() {
    return {
      test: 'aaaa'
    }
  },
  computed: {
    ...mapGetters({
      articles: 'article/allArticles',
    })
  },
  created () {
    this.$store.dispatch("fetchArticles");
  }
}
</script>
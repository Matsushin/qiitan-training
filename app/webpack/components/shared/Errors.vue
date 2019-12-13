<template>
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
</template>

<script>
export default {
  props: {
    errors: {
      type: Array,
      default: () => {}
    }
  }
}
</script>

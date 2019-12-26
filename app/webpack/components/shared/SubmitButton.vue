<template>
  <button @click="handleClick">
    <slot/>
  </button>
</template>

<script>
export default {
  methods: {
    handleClick(event) {
      this.$emit('click', event)
    }
  }
}
</script>

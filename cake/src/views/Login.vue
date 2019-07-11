<template>
  <div>
    <h1>登陆和注册</h1>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  created() {
    // 不需要公共的头部和尾部
    this.$emit("show_footer", false);
  },
  methods: {}
};
</script>
<style scoped>
</style>



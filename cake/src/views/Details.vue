<template>
  <div>
    <h1>详情页{{pid}}</h1>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  props: ["pid"],
  created() {
    // 不需要公共的头部和尾部
    this.$emit("show_footer", false);
    // this.axios.get().then();
  },
  methods: {}
};
</script>
<style scoped>
</style>



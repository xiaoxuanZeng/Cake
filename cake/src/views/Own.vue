<template>
  <div>
    <h1>个人中心</h1>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  created() {
    // 需要公共的头部和尾部
    this.$emit("show_footer", true);
  },
  methods: {}
};
</script>


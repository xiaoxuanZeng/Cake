<template>
  <div class="page-navbar">
    <mt-navbar class="page-part" v-model="selected">
      <mt-tab-item id="1">注册</mt-tab-item>
      <mt-tab-item id="2">登录</mt-tab-item>
    </mt-navbar>
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="1">
        <mt-field placeholder="请输入常用手机号" class="float-left">
          <mt-buton class="text-btn float-left">获取验证码</mt-buton>
        </mt-field>
        <mt-field placeholder="请输入验证码" label="验证码" class="float-left"></mt-field>
      </mt-tab-container-item>
      <mt-tab-container-item id="2">
        <mt-field placeholder="请输入"></mt-field>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
export default {
  data() {
    return {
      selected: "1"
    };
  },
  created() {
    // 不需要公共的头部和尾部
    this.$emit("show_footer", false);
  },
  methods: {}
};
</script>
<style>
.page-navbar {
  margin-top: 20px;
}
.page-navbar .mint-tab-item-label{
  font-size: 16px
}

.float-left{
  float: left;
}
</style>



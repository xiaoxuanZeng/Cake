<template>
  <div>
    <div>
      <mt-tab-container v-model="active">
        <!-- 首页 -->
        <mt-tab-container-item id="myIndex">
          <h1>首页</h1>
        </mt-tab-container-item>
        <!-- 分类 -->
        <mt-tab-container-item id="myProduct" class="mem">
          <classify></classify>
        </mt-tab-container-item>
        <!-- 购物车 -->
        <mt-tab-container-item id="MyCart">
          <cart></cart>
        </mt-tab-container-item>
        <!-- 个人中心 -->
        <mt-tab-container-item id="me">
          <own></own>
        </mt-tab-container-item>
      </mt-tab-container>

      <!-- 底部 -->
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="myIndex">首页</mt-tab-item>
        <mt-tab-item id="myProduct">所有商品</mt-tab-item>
        <mt-tab-item id="MyCart">购物车</mt-tab-item>
        <mt-tab-item id="me">个人中心</mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
// 导入需要的子组件(分类,购物车,个人中心)
import Classify from "./Classify.vue";
import Cart from "./Cart";
import Own from "./Own";

export default {
  data() {
    return {
      active: "myProduct"
    };
  },
  // 注册子组件
  components: {
    Classify: Classify,
    cart: Cart,
    own: Own
  }
};
</script>
<style>
.mem{
  height: 500px;
}
</style>




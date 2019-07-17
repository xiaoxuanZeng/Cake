<template>
  <div>
    <div>
      <mt-tab-container v-model="active">
        <!-- 首页 -->
        <mt-tab-container-item id="myIndex">
          <div class="myIndexBotton" style="text-align: center;;width:100%">
            <!-- 搜索 -->
            <div class="mySearch">
              <span class="iconfont sousuo" @click.native="$router.push('/Search')">&#xe65f;&nbsp;搜索</span>
            </div>
            <!-- 产品导航 -->
            <div class="product-nav">
              <div class="list-nav" @click="detail">
                <i class="iconfont">&#xe6be;</i>
                <span class="list-menu">蛋糕</span>
              </div>
              <div class="list-nav" @click="detail">
                <i class="iconfont">&#xe666;</i>
                <span class="list-menu">甜点</span>
              </div>
              <div class="list-nav" @click="detail">
                <i class="iconfont">&#xe613;</i>
                <span class="list-menu">小食</span>
              </div>
              <div class="list-nav" @click="detail">
                <i class="iconfont">&#xe601;</i>
                <span class="list-menu">礼盒</span>
              </div>
            </div>
            <!-- 推荐 -->
            <router-link to="#">
              <img src="images/product/64sd78f5465sda4170.jpg" />
            </router-link>
            <!-- 公告 -->
            <div class="gonggao">
              <p class="iconfont">
                <span class="up">
                  <i class="iconfont">&#xe61a;</i>
                </span>
                <span to="#" class="slide">
                  <i>店铺营业时间为：8:30-18:00,对每一份甜点心怀敬意,为保证最佳赏味,请提前预约制作。</i>
                </span>
              </p>
            </div>
            <mt-swipe :auto="3000" :defaultIndex="0" :show-indicators="true">
              <mt-swipe-item>
                <router-link to="#">
                  <img src="images/product/64sd78f5465sda414.png" alt />
                </router-link>
              </mt-swipe-item>
              <mt-swipe-item>
                <router-link to="#">
                  <img src="images/product/64sd78f5465sda4170.jpg" alt />
                </router-link>
              </mt-swipe-item>
              <mt-swipe-item>
                <router-link to="#">
                  <img src="images/product/64sd78f5465sda4171.jpg" alt />
                </router-link>
              </mt-swipe-item>
              <mt-swipe-item>
                <router-link to="#">
                  <img src="images/product/64sd78f5465sda4159.jpg" alt />
                </router-link>
              </mt-swipe-item>
              <mt-swipe-item>
                <router-link to="#">
                  <img src="images/product/64sd78f5465sda4121.jpg" alt />
                </router-link>
              </mt-swipe-item>
            </mt-swipe>
            <!-- 小食 -->
            <div class="snack-list clearfix">
              <span class="snack-title">小食</span>
              <router-link :to="`/ProductList/${cid}`" class="product-more">更多&gt;</router-link>
            </div>
            <div class="snack-list clearfix" style="margin-bottom: 15px;">
              <ul class="mylist">
                <li class="snack-item" v-for="(item,i) of product_list" :key="i">
                  <router-link :to="`/Details/${item.pid}`">
                    <img :src="`http://127.0.0.1:7700/${item.pic}`" alt />
                    <span class="title" v-text="item.pname"></span>
                    <span class="price" v-text="`￥${item.price}`"></span>
                  </router-link>
                </li>
              </ul>
            </div>
            <div style="height:1.464rem;"></div>
            <!-- index -->
          </div>
        </mt-tab-container-item>
        <!-- 分类 -->
        <mt-tab-container-item id="myProduct" :style="`height:${resizeHeight}px`">
          <classify></classify>
        </mt-tab-container-item>
        <!-- 购物车 -->
        <mt-tab-container-item id="myCart">
          <cart></cart>
        </mt-tab-container-item>
        <!-- 个人中心 -->
        <mt-tab-container-item id="me" :style="`height:${resizeHeight}px`">
          <own></own>
        </mt-tab-container-item>
      </mt-tab-container>

      <!-- 底部 -->
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="myIndex" @click.native="changeState(0)">
          <!-- <img slot="icon" src="images/1.jpg" /> -->
          <span slot="icon" class="iconfont myicon">&#xe604;</span>首页
        </mt-tab-item>
        <mt-tab-item id="myProduct" @click.native="changeState(0)">
          <span slot="icon" class="iconfont myicon">&#xe632;</span>所有商品
        </mt-tab-item>
        <mt-tab-item id="myCart" @click.native="changeState(0)">
          <span slot="icon" class="iconfont myicon">&#xe611;</span>购物车
        </mt-tab-item>
        <mt-tab-item id="me" @click.native="changeState(0)">
          <span slot="icon" class="iconfont myicon">&#xe615;</span>个人中心
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
// 导入eventBus 兄弟之间通信
import { eventBus } from "../eventBus.js";
// 导入需要的子组件(分类,购物车,个人中心)
import Classify from "./Classify.vue";
import Cart from "./Cart";
import Own from "./Own";
export default {
  data() {
    return {
      active: "myIndex",
      // 屏幕的高度
      resizeHeight: 650,
      // 轮播图的数据
      carousel_list: [],
      // 首页显示某个系列的商品数据
      product_list: [],
      // 某个系列下的id
      cid: 7,
      // 保存当前状态
      currentIndex: [
        { isSelect: true },
        { isSelect: false },
        { isSelect: false },
        { isSelect: false }
      ]
    };
  },
  // props: ["old_active"],
  created() {
    // console.log(this.$route.meta.isBack);

    // 屏幕可用区域变化时执行 (分类的高度需要与屏幕高度一样)
    this.resizeHeight = screen.availHeight;
    window.addEventListener("resize", () => {
      this.resizeHeight = screen.availHeight;
    });

    this.load();
  },
  // 注册子组件
  components: {
    Classify: Classify,
    cart: Cart,
    own: Own
  },
  methods: {
    load() {
      // 获取后台数据显示 需要传入某系列的cid
      var cid = this.cid;
      this.axios.get("/index/index", { params: { cid: cid } }).then(result => {
        // console.log(result.data.data);
        var list = result.data.data;
        this.carousel_list = list.carousel;
        this.product_list = list.product;
      });
    },
    changeState(n) {
      // 1: n当前按钮下标
      // 2: 创建循环数据
      for (var i = 0; i < this.currentIndex.length; i++) {
        // 3: 如果当前下标与参数下标一致 true
        if (n == i) {
          this.currentIndex[i].isSelect = true;
        } else {
          // 4: 其他元素 false
          this.currentIndex[i].isSelect = false;
        }
      }
    },
    detail() {
      this.active = "myProduct";
    },
    select_active: function(bool) {
      this.active = bool;
      console.log(bool);
    }
  },
  watch: {
    active() {
      // console.log(123)
    }
  },
  beforeRouteEnter(to, from, next) {
    // console.log(to);
    //判断是从哪个路由过来的，
    if (from.name == "Infornation") {
      // to.meta.isBack = false;
      next(vm => {
        // console.log(vm); //vm为vue的实例
        // console.log("组件路由钩子beforeRouteEnter的next");
        vm.active = "me";
      });
      return;
    }
    next();
  }
  // activated() {
  //   // console.log(this.active);
  //   // this.active="myCart"
  //   // console.log(789);
  //   // console.log(this.$route.meta.isBack);

  //   this.$emit("updateCart", true);
  //   if (!this.$route.meta.isBack) {
  //     // console.log(123);
  //     // 如果isBack是false，表明需要获取新数据，否则就不再请求，直接使用缓存的数据
  //     this.load();
  //   }
  //   // 恢复成默认的false，避免isBack一直是true，导致下次无法获取数据
  //   this.$route.meta.isBack = false;
  // }
};
</script>
<style scope>
.mySearch {
  border-bottom: 1px solid #ddd;
  background: #f1f1f1;
  margin-top: 0;
  padding: 15px 0 10px 0;
}
.bold {
  font-weight: bold;
}
.list-nav i {
  color: #555453;
  font-size: 34px !important;
}
.sousuo {
  display: block;
  width: 92%;
  border: 1px solid #5555;
  border-radius: 5px;
  color: #ccc;
  background-color: #f1f1f1;
  /* text-align:center; */
  margin: 0 auto;
  /* margin-top: 43px; */
  font-size: 18px;
  line-height: 30px;
}
.clearfix::before {
  content: "";
  clear: both;
  display: block;
}
.clearfix::after {
  content: "";
  clear: both;
  display: block;
}
/* 顶部食品类型 */
img {
  width: 95%;
}
.product-nav {
  margin: 0.28rem;
  text-align: center;
  display: flex;
}
.product-nav .list-nav {
  width: 24%;
  justify-content: space-around;
}
.product-nav .list-nav i {
  display: block;
  font-size: 1rem;
  margin-bottom: 0.2rem;
}
.product-nav .list-nav span.list-menu {
  font-size: 0.35rem;
  color: #333;
  display: block;
}
/* 公告 */
.gonggao {
  text-align: left;
  width: 95%;
  display: inline-block;
  overflow: hidden;
}
.gonggao p {
  display: inline-block;
  position: relative;
}
.gonggao span.up {
  width: 4%;
  background: #fff;
  color: #243f4c;
  overflow: hidden;
  vertical-align: middle;
  float: left;
}
.gonggao .slide {
  width: 96%;
  color: #795548;
  float: left;
  overflow: hidden;
}
.gonggao .slide i {
  font-style: normal;
  display: inline-block;
  animation: translatex 7s linear infinite;
  white-space: nowrap;
}
@keyframes translatex {
  0% {
    transform: translateX(0px);
  }
  100% {
    transform: translateX(-620px);
  }
}
/* 轮播 */
.mint-swipe {
  height: 200px !important;
  width: 100%;
}
/* classify */
.mem {
  height: 15.333333rem;
}
/* 小食 */
.snack-list {
  width: 95%;
  font-size: 0.45rem;
  margin: 0.28rem auto;
  box-sizing: border-box;
  letter-spacing: 1px;
}
/* 弹性布局 首页商品 */
.mylist {
  display: flex;
  /* 换行 */
  flex-wrap: wrap;
  justify-content: space-around;
  width: 100%;
}
.mylist > li {
  width: 33.3%;
  margin-bottom: 3px;
}
/* 图片 */
.snack-item img {
  /* width: 100%; */
  width: 116px;
  height: 116px;
}
.snack-list .snack-title {
  float: left;
  text-align: left;
  width: 50%;
}
.snack-list .product-more {
  width: 50%;
  text-align: right;
  float: right;
  color: #824e3b;
  font-size: 0.45rem;
}
.snack-list .snack-item {
  /* float: left;
  width: 33.3%; */
  text-align: left;
}
.snack-item span {
  margin: 0.12rem 0;
  font-weight: 600;
  white-space: pre-wrap;
  font-size: 0.4rem;
  display: block;
}
.snack-item .title {
  display: inline-block;
  color: #333;
  height: 32px;
}
.snack-item .price {
  color: crimson;
}
/* 搜索框的高 */
.mySearch {
  height: 32px;
}
.mint-searchbar {
  background-color: #efeff4 !important;
}
/* 取消的文字样式 */
.mySearch .mint-searchbar-cancel {
  font-size: 14px !important;
  color: #000 !important;
}
/* 搜索框的文字样式 */
.mySearch .mint-searchbar-core {
  font-size: 14px !important;
}
/* 底部icon图标 */
.myicon {
  font-size: 22px;
}
/* 底部选项卡的高度 */
.mint-tabbar.is-fixed {
  height: 1.464rem;
}
</style>
<template>
  <div>
    <div class="mt">
      <div class="fl">
        <i class="iconfont" @click="$router.push('/Index')">&#xe732;</i>
      </div>
      <div>
        <p class="search_title">搜索</p>
      </div>
    </div>
    <div class="search">
      <input type="text" />
      <i class="iconfont">&#xe65f;</i>
      <button>搜索</button>
    </div>
    <div class="hot_search">
      <div class="h_title">热门搜索</div>
      <div class="h_content">
        <ul class="key_word">
          <li v-for="(item,i) of list" :key="i" v-text="item.pname"></li>
        </ul>
      </div>
      <div class="history">
      <div class="h_title">搜索历史</div>
         <ul class="key_word">
            <li>蛋糕</li>
            <li>小吃</li>
         </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
       list:[]
    };
  },
  created(){
     this.axios.get("/product/search").then(result=>{
        console.log(result)
        this.list=result.data
        console.log(this.list)
     })
  },
};
</script>

<style>
.mt {
  margin: 10px 0;
  overflow: hidden;
}
.fl {
  float: left;
}
.fl .iconfont {
  font-weight: bolder;
  font-size: 25px;
  margin-left: 6px;
}
.search_title {
  font-size: 18px;
  text-align: center;
  margin-top: 5px;
}
.search input {
  border: 1px solid #ddd;
  width: 80%;
  height: 33px;
  position: relative;
  margin-left: 15px;
  outline: none;
  font-size: 16px;
  text-indent: 26px;
}
/* 搜索框 */
.search {
  position: relative;
}
.search button {
  width: 15%;
  height: 33px;
  border: 0;
  background: transparent;
  outline: none;
  position: absolute;
  top: 5px;
  font-size: 14px;
  font-weight: lighter;
}
.search .iconfont {
  position: absolute;
  left: 15px;
  top: 40%;
  margin-left: 5px;
}
/* 热门搜索 */
.h_title {
  font-size: 17px;
  margin: 15px 0 15px 15px;
}
.key_word {
  overflow: hidden;
  margin-left: 15px;
}
.key_word li {
  float: left;
  background: #ddd;
  margin-right: 12px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 13px;
  margin-bottom: 10px;
  padding: 5px;
}
</style>


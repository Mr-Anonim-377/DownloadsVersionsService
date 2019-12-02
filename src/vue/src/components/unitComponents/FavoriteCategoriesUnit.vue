<template>
<div>
              <div class="main_container_banner">
                <div class="row row_product_child">
                  <h1 class="text">{{favoriteCategory.favoriteCategory}}</h1>
                </div>
              </div>
              <div class="main_container_banner">
                <div class="row row_product_child">
                  <a class="article_child_left"></a>
                  <FavoriteCategoryUnitProduct/>
                  <a class="article_child_right"></a>
                </div>
              </div>
              </div>
</template>

<script>
  import FavoriteCategoryUnitProduct from './FavoriteCategoryUnitProduct'
export default {
props:{
  favoriteCategory:{}
},
  components:{FavoriteCategoryUnitProduct}

}
</script>

<style>

</style>

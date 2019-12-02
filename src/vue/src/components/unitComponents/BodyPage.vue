<template>
  <section class="section">
    <div class="section_main">
      <div class="main"></div>
      <div class="main_container">
        <div class="row">
          <div class="row_carousel">
            <CollectionsCarusel/>
          </div>
          <div class="main_container_also">
            <BanersBodyPage/>
            <FavoriteCategoriesCarusel/>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
import CollectionsCarusel from './CollectionsCarusel'
import BanersBodyPage from './BanersBodyPage'
import FavoriteCategoriesCarusel from './FavoriteCategoriesCarusel'
export default {
  components: { CollectionsCarusel, BanersBodyPage, FavoriteCategoriesCarusel }
}
</script>
<style>
</style>

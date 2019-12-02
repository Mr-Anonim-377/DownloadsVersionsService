<template>
  <div class="container_circle">
    <div class="triangle_top"></div>
    <div>
      <CollectionsCaruselUnit v-for = "collection in collections" :collection="collection"></CollectionsCaruselUnit>
    </div>
    <div class="triangle_bottom"></div>
  </div>
</template>
<script>
import CollectionsCaruselUnit from './CollectionsCaruselUnit'

export default {
  data () {
    return {collections: []
      }
  },
  components: {CollectionsCaruselUnit},
  created: function init () {
    fetch('http://localhost:8080/collection/all')
      .then(response => response.json())
      // eslint-disable-next-line
      .then(commits => this.collections = commits)
  }

}

</script>
<style>
</style>

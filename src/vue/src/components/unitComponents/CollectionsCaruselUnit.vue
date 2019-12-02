<template>
  <div class = "circle">
  <a class="article" href=""> <img class="article_pictures"  v-bind:src="imagePatch.imagePatch"  />{{collection.collectionName}}</a>
  </div>
</template>

<script>

export default {
  props: {
    collection:{},
    imagePatch:String
  },

  created: function init () {
    fetch('http://localhost:8080/image/'+this.collection.imageId)
      .then(response => response.json())
      // eslint-disable-next-line
      .then(commits => this.imagePatch = commits)
  }
}
</script>

<style>

</style>

<template>
  <div id="app">
    <Header/>
    <Navigation/>
    <CurrentBaner/>
    <BodyPage/>
  </div>
</template>
<script>
import Header from '@/components/unitComponents/Header'
import Navigation from '@/components/unitComponents/Navigation'
import CurrentBaner from '@/components/unitComponents/CurrentBaner'
import BodyPage from '@/components/unitComponents/BodyPage'
export default {
  name: 'mainPageComponent',
  components: {
    Header,
    Navigation,
    CurrentBaner,
    BodyPage
  }
}
</script>

<style scoped>

</style>

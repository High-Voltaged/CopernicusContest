<template>

   <div>
      
      <Navbar></Navbar>

      <nuxt class="height-fixed"/>
   
   </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import Navbar from '../components/navbar/Navbar.vue';

    @Component({
        components: {
           Navbar,
        }
    })
    export default class layout extends Vue {}

</script>
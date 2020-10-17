<template>
   
   <router-link 
      :to="link.to" 
      tag="div" 
      class="inline-block w-full hover:bg-gray-secondary sm:hover:bg-gray-primary transition duration-300 linear"
      style="border-radius: 10px"
   >

      <span class="inline w-full text-gray-200 text-center font-medium hover:text-white transition duration-300 linear px-2 py-1">
         {{ link.content }}
      </span>

   </router-link>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';

   @Component({
      name: "NavbarLIink",
   })
   export default class NavbarLIink extends Vue {

      @Prop() private link;

   }

</script>
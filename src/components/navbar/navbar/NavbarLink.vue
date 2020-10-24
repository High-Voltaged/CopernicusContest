<template>
   
   <router-link 
      :to="link.to" 
      tag="div" 
      class="inline-block w-full sm:w-auto px-3 py-2 hover:bg-gray-secondary sm:hover:bg-gray-primary transition duration-300 linear cursor-pointer"
      style="border-radius: 10px"
   >

      <span class="inline-block w-full text-gray-200 text-center font-medium hover:text-white capitalize transition duration-300 linear">
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
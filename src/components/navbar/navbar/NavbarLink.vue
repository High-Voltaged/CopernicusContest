<template>
   
   <router-link 
      :to="link.to" 
      tag="div" 
      class="flex-0 inline-block w-3/5 md:w-auto px-3 py-2 hover:bg-gray-secondary md:hover:bg-gray-tertiary transition duration-300 linear cursor-pointer"
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
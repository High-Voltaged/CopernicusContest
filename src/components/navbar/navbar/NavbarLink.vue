<template>
   
   <router-link :to="link.to">

      <span class="block text-gray-200 font-light hover:bg-gray-secondary sm:hover:bg-gray-primary hover:text-white transition duration-300 linear px-2 py-1 rounded">
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
<template>
   
   <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-2">
     
      <div class="w-4 h-4 hidden lg:block">
     
         <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
     
      </div>
     
      <div class="w-2 h-2 block lg:hidden">
     
         <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
     
      </div>
     
      <router-link :to="link.to">

         <span class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">
            {{ link.content }}
         </span>

      </router-link>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';

   @Component({
      name: "FooterLink",
   })

   export default class FooterLink extends Vue {

      @Prop() private link; 

   }

</script>
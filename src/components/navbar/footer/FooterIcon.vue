<template>

   <div class="lg:w-10 lg:h-10 w-8 h-8">

      <router-link to="">

         <font-awesome-icon 
            :icon="['fab', icon]" 
            class="fill-current text-gray-200 w-full h-full px-1 lg:px-2 transition duration-300 ease transform hover:translate-y-2"
         />

      </router-link>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';

   @Component({
      name: "FooterIcon",
   })

   export default class FooterIcon extends Vue {

      @Prop() private icon; 

   }
   
</script>
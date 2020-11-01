<template>
   
   <div class="w-full px-2 md:px-4">
      
      <span v-if="content.subtitle" class="block text-center uppercase text-gray-300 font-light leading-tight">
         {{ content.subtitle }}
      </span>
      <span class="block text-center text-4xl md:text-5xl capitalize font-semibold leading-tight text-gray-200">
         {{ content.title }}
      </span>

      <div v-if="divider" class="divider relative h-px my-5 min-w-full">
         <div class="div-transparent  absolute top-0 left-1/20 right-1/20 h-px">
            <div class="div-dot absolute rounded-full bg-gray-tertiary cursor-pointer transition transform hover:scale-75 duration-500 linear"></div>
         </div>
      </div>

      <p v-if="content.paragraph" class="text-center font-light text-gray-300">
         {{ content.paragraph }}
      </p>
   
   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";

   @Component({
      name: "MainTitle",
      components: {
      },
   })
   export default class MainTitle extends Vue {

      @Prop() private content;
      @Prop({ default: true }) private divider?: boolean;

   }

</script>
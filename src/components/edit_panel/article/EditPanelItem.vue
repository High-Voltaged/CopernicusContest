<template>

   <button @click="$emit('click')" class="flex-0 flex flex-col items-start justify-center w-full sm:w-4/5 lg:w-2/5 2xl:w-1/5 min-h-20 m-2 space-y-1 p-5 rounded-lg shadow-lg bg-gray-tertiary cursor-pointer focus:outline-none">

      <div v-if="article" class="flex items-center space-x-3">

         <div class="inline-flex">
             <span class="text-left text-sm font-medium text-white">
                 #{{ article.id }}
             </span>
         </div>

         <div class="flex-auto inline-flex">
             <span class="text-left text-base font-semibold tracking-wide text-white">
                 {{ article.title }}
             </span>
         </div>

      </div>

      <div class="flex-auto flex w-full">
          <p class="text-left text-sm text-gray-200">
              {{ article.content }}
          </p>
      </div>

   </button>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";

   @Component({
      name: "EditPanelItem",
   })
   export default class EditPanelItem extends Vue {

       @Prop() private article;

   }

</script>
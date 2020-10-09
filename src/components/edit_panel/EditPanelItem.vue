<template>

   <button @click="$emit('click')" class="flex-0 flex flex-col items-start justify-center min-h-20 m-2 space-y-1 p-5 rounded-lg shadow-lg bg-gray-tertiary cursor-pointer focus:outline-none">

      <div class="flex items-center space-x-3">

         <div class="inline-flex">
            <span class="text-left text-sm font-medium text-white">
               #{{ item.id }}
            </span>
         </div>

         <div class="flex-auto inline-flex">
            <span class="text-left text-base font-semibold tracking-wide text-white">
               {{ item.title }}
            </span>
         </div>

      </div>

      <div class="flex-auto flex w-full">
         <p class="text-left text-sm text-gray-200">
            {{ item.info }}
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

      @Prop() private item;

   }

</script>
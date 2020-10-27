<template>

   <div class="flex items-center justify-center h-screen w-screen bg-gray-main">

      <div class="loading relative">

         <div class="loading_shape_1 absolute top-0"></div>

         <div class="loading_shape_2 absolute top-0"></div>

      </div>

   </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
import { component } from 'vue/types/umd';

    @Component({
        name: "Loading",
    })

    export default class Loading extends Vue {}

</script>
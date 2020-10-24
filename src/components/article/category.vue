<template>

   <div v-if="category" @click="viewCategory" class="inline-block w-full h-full">

      <span class="text-white text-center lg:text-left leading-tight font-light select-none"> 
         {{ category.name }} 
      </span>

   </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "Category",
    })
    export default class Category extends Vue {

        @Prop() private category;

        viewCategory(): void {

            this.$router.push("/category/" + this.category.id);

        }

    }

</script>
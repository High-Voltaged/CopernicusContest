<template>

   <div class="flex flex-col items-start">

      <MajorArticle
         v-for="(article, i) in articles"
         :key="article.id"
         :article="article"
         :index="i + 1"
      ></MajorArticle>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import MajorArticle from './MajorArticle.vue';

   @Component({
      name: "MajorArticles",
      components: {
         MajorArticle,
      },
   })
   export default class MajorArticles extends Vue {

      articles = [

         { id: 10, title: 'Something here', content: ['Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit'] },
         { id: 20, title: 'Some other stuff here', content: ['Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit'] },

      ]

   }

</script>
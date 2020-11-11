<template>

   <div class="main-container overflow-y-auto">

      <CategoriesList> </CategoriesList>

   </div>

</template>

<script lang="ts">

	import { Component, Prop, Vue } from "nuxt-property-decorator";
   import CategoriesList from '../components/categories/categories/Categories.vue';
	import Navbar from '../components/navbar/Navbar.vue';

	@Component({
		name: "CategoriesPage",
		components: {
         CategoriesList,
         Navbar,
		},
	})
    export default class CategoriesPage extends Vue {

      mounted() {

         this.$nextTick(() => {

            setTimeout(() => this.$nuxt.$loading.finish(), 300);

         });

      }

      destroyed() {

         this.$nuxt.$loading.start();

      }

	}

</script>
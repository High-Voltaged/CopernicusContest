<template>

	<div>

      <Navbar />

		<div class="main-container overflow-y-auto">

			<div class="main-title w-full bg-gray-500 shadow-lg">

				<div class="w-full h-24 relative flex items-center px-3">

					<div class="absolute inset-0">
						<img src="../img/banner.jpg" class="h-full w-full object-cover opacity-25" />
					</div>

				</div>

			</div>

			<CategoriesList> </CategoriesList>

			<Footer />

		</div>

	</div>

</template>

<script lang="ts">

	import { Component, Prop, Vue } from "nuxt-property-decorator";
   import CategoriesList from '../components/categories/categories/Categories.vue';
	import Navbar from '../components/navbar/Navbar.vue';
	import Footer from '../components/navbar/Footer.vue';

	@Component({
		name: "CategoriesPage",
		components: {
         CategoriesList,
         Navbar,
         Footer,
		},
	})
    export default class CategoriesPage extends Vue {

	}

</script>
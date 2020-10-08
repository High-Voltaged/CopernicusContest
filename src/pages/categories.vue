<template>

	<div>

      <Navbar />

		<div class="main-container overflow-y-auto">

			<div class="main-title w-full bg-gray-500 shadow-lg">

				<div class="w-full h-24 relative flex items-center px-3">

					<div class="absolute inset-0">
						<img src="https://images.unsplash.com/photo-1512840399005-5bce2b583140?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="h-full w-full object-cover opacity-25" />
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
	import ApiUtils from "../scripts/api_utils";
    import CategoriesList from '../components/categories/categories/categories.vue';
	import Footer from '../components/navbar/Footer.vue';

	@Component({
		name: "contentPage",
		components: {
            CategoriesList,
			Footer,
		},
	})
	export default class contentPage extends Vue {

	}

</script>
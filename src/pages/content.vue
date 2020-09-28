<template>

	<div>

		<div class="main-container overflow-y-auto">

			<div class="main-title w-full h-104 md:h-88 bg-gray-500 shadow-lg">

				<div class="w-full h-full relative flex justify-center items-center">

					<div class="absolute inset-0">

						<img src="https://images.unsplash.com/photo-1512840399005-5bce2b583140?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="h-full w-full object-cover opacity-25" />

					</div>

				</div>

			</div>

			<div class="article-content flex flex-col items-center lg:flex-row lg:items-start lg:justify-center p-5 sm:px-12 md:px-20 2xl:px-32">

				<div class="w-full lg:w-3/5 2xl:w-2/5 lg:mr-10 -mt-44 lg:-mt-48 z-10">

					<span class="block capitalize text-3xl lg:text-4xl font-bold tracking-tight leading-tight text-gray-200 my-4 md:my-2"> {{ article.title }} </span>

					<div class="bg-gray-main p-5 xl:p-10 rounded-md shadow-lg flex flex-col items-center">

						<div class="text-justify text-sm xl:text-base leading-relaxed xl:leading-loose font-light text-gray-300" v-for="paragraph in article.content">

							<p> {{ paragraph }} </p>

						</div>

						<div class="flex justify-center mt-5 w-full">
							<!-- additional container, in case of having an image -->

							<div class="flex flex-col items-start max-w-9/10 bg-gray-tertiary rounded-lg px-4 py-2 shadow-md">

								<div class="mt-2 w-full">

									<div class="text-xs font-light text-gray-400 text-right italic"> Date published: {{ article.timestamp }} </div>

								</div>

								<div class="mt-2">

									<span class="text-xl ml-1 tracking-wide text-gray-200 capitalize"> Author: {{ article.author_name }} </span>

								</div>

								<div class="flex items-center justify-center h-px w-full my-2">
									<div class="divider w-full h-full"></div>
								</div>

								<div class="article-link flex items-center cursor-pointer">

									<font-awesome-icon :icon="['fas', 'hashtag']" class="h-4 w-4 fill-current text-purple-secondary" />
										
									<span class="article-header ml-2 text-gray-300 font-semibold lg:transition duration-300 ease">Category name</span>

								</div>

								<div class="flex items-center mt-2 mx-1 text-white hover:text-purple-secondary transition duration-300 ease cursor-pointer">

									<font-awesome-icon :icon="['fas', 'eye']" class="w-4 h-4 fill-current" />

									<div class="ml-2">
										<span class="text-sm font-light tracking-wide">Times viewed:</span>
										<span class="text-sm font-light tracking-wide"> {{ article.times_read }} </span>
									</div>

								</div>

							</div>

						</div>

					</div>

				</div>

				<ArticleSidebar :categories="categories" :articles="popular_articles"></ArticleSidebar>

			</div>

			<Footer />

		</div>

	</div>

</template>

<script lang="ts">

	import moment from "moment";
	import { Component, Prop, Vue } from "nuxt-property-decorator";
	import ApiUtils from '../scripts/api_utils';
	import ArticleSidebar from '../components/article/article_sidebar.vue';
	import Footer from '../components/navbar/Footer.vue';
	import IBriefArticle from '../../interfaces/brief_article';
	import ICategory from '../../interfaces/category';
	import IFullArticle from '../../interfaces/full_article';

	@Component({
		name: "contentPage",
		components: {
			ArticleSidebar,
			Footer,
		},
	})
	export default class contentPage extends Vue {

		article = [];

		categories: ICategory[] = [];

		popular_articles: IBriefArticle[] = [];

		async beforeMount() {

			this.article = await ApiUtils.fetchArticle(Number(this.$route.params.id));

			this.article = this.article[0];

			this.article.timestamp = moment(this.article.timestamp).format('YYYY-MM-DD HH:mm:s');

			let temp_content = this.article.content.split("\n");

			this.article.content = temp_content;

			let popular_articles = await ApiUtils.fetchPopularArticles();

			for (let i = 0; i < popular_articles.length; ++i) {

				let temp_article: IBriefArticle = {} as IBriefArticle;

				temp_article.ID = popular_articles[i].id;
				temp_article.TimesRead = popular_articles[i].times_read;
				temp_article.Title = popular_articles[i].title;
				temp_article.Timestamp = moment(popular_articles[i].timestamp).format('YYYY-MM-DD HH:mm:s');

				this.popular_articles.push(temp_article);

			}

			let categories = await ApiUtils.fetchCategories();

			for (let i = 0; i < categories.length; ++i) {

				let temp_category: ICategory = {} as ICategory;

				temp_category.ID = categories[i].id;
				temp_category.Name = categories[i].name;

				this.categories.push(temp_category);

			}

		}

	}

</script>
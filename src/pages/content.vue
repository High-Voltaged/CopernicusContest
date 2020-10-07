<template>

	<div>

      <Navbar /> 

		<div class="main-container overflow-y-auto">

			<div class="main-title w-full h-88 bg-gray-500 shadow-lg">

				<div class="w-full h-full relative flex justify-center items-center">

					<div class="absolute inset-0">

						<img src="https://images.unsplash.com/photo-1512840399005-5bce2b583140?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="h-full w-full object-cover opacity-25" />

					</div>

				</div>

			</div>

			<div class="article-content flex flex-col items-center lg:flex-row lg:items-start lg:justify-center p-5 sm:px-12 md:px-20 2xl:px-32">

				<div class="flex flex-col items-center w-full lg:w-3/5 2xl:w-2/5 relative lg:mr-10 -mt-88 lg:-mt-48 z-10">

               <div class="article-content__img flex-0 lg:absolute overflow-hidden mb-6">

                  <div class="inline-block relative">

                     <img :src="temp_image" class="object-fit" />

                     <slot v-if="editOn" name="editImg"></slot>

                  </div>

               </div>

					<span v-if="!editOn" class="block capitalize text-3xl lg:text-4xl font-bold tracking-tight leading-tight text-gray-200 my-4 md:my-2"> 
                  {{ article.title }} 
               </span>

               <slot name="editTitle"></slot>

					<div class="bg-gray-main p-5 xl:p-10 rounded-md shadow-lg flex flex-col items-center w-full">

                  <div v-if="!editOn" class="w-full h-full flex flex-col items-center">

                     <div 
                        v-for="(para, i) in article.content"
                        :key="i"
                        class="text-justify text-sm xl:text-base leading-relaxed xl:leading-loose font-light text-gray-300" 
                     >

                        <p> {{ para }} </p>

                     </div>

                  </div>

                  <slot name="editContent"></slot>

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

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import moment from 'moment';
   import ApiUtils from '../scripts/api_utils';
   import IBriefArticle from '../../interfaces/brief_article';
   import ICategory from '../../interfaces/category';
   import { vxm } from '../store';
   
	import ArticleSidebar from '../components/article/article_sidebar.vue';
	import Navbar from '../components/navbar/Navbar.vue';
	import Footer from '../components/navbar/Footer.vue';

	@Component({
		name: "contentPage",
		components: {
         ArticleSidebar,
         Navbar,
			Footer,
		},
	})
	export default class contentPage extends Vue {

      @Prop({ default: false }) private editOn?: boolean;

      temp_image = 'https://images.unsplash.com/photo-1602027011277-38ad4edddeca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60';

      async beforeMount() {

         vxm.articles.fetchArticle(this.$route.params.id);

      }

		get article() {

         return vxm.articles.getUtil.article;

      }

      get categories() {

         return vxm.articles.getUtil.categories;

      }

      get popular_articles() {

         return vxm.articles.getUtil.popular_articles;

      }

      // beforeDestroy() {

      //    vxm.articles.setArticle(null);

      // }

	}

</script>
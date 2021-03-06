export namespace Links {

	export const fetch_article: string = "/api/fetchArticle";

	// Fetch the article but don't increment the view counter, used for editing the aticles
	export const fetch_article_stealth: string = "/api/fetchArticleStealth";

	export const fetch_articles: string = "/api/fetchArticles";

	export const fetch_popular_articles: string = "/api/fetchPopularArticles";

	export const fetch_important_articles: string = "/api/fetchImportantArticles";

	export const fetch_articles_by_category: string = "/api/fetchArticlesByCategory";

	export const fetch_digest: string = "/api/fetchDigest";

	export const fetch_edit_articles_list: string = "/api/fetchEditArticleList";

	export const fetch_edit_categories: string = "/api/fetchEditCategories";

	export const fetch_categories: string = "/api/fetchCategories";

	export const fetch_category: string = "/api/fetchCategory";

	export const fetch_quiz_questions: string = "/api/fetchQuizQuestions";

	// Fetches quiz questions, but all of them and ordered by question id instead
	export const fetch_edit_quiz_questions: string = "/api/fetchEditQuizQuestions";

	export const admin_panel_login: string = "/api/login";

	export const insert_article: string = "/api/insertArticle";

	export const edit_article: string = "/api/editArticle";

	export const delete_article: string = "/api/deleteArticle";

	export const delete_quiz_question: string = "/api/deleteQuizQuestion";

	export const update_quiz_question: string = "/api/updateQuizQuestion";

	export const insert_quiz_question: string = "/api/insertQuizQuestion";

	export const validate_session: string = "/api/validateSession";

	export const insert_category: string = "/api/insertCategory";

	export const edit_category: string = "/api/editCategory";

	export const delete_category: string = "/api/deleteCategory";

};
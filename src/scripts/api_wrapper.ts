import Links from "../../app/links";
import axios, { AxiosError, AxiosRequestConfig, AxiosResponse } from "axios";
import IBriefArticle from "../../interfaces/brief_article";
import Codes from "../../../app/codes";

export namespace APIWrapper {

    export async function fetchDigest(): Promise<Array<IBriefArticle>> {

        let response = await axios.post(Links.FETCH_DIGEST);

        return response.data["response"];

    }

    export async function fetchArticle(id: number): Promise<string> {

        let response = await axios.post(Links.FETCH_ARTICLE, { id: id });

        return response.data["response"];

    }

    export async function fetchPopularArticles(): Promise<string> {

        let response = await axios.post(Links.FETCH_POPULAR_ARTICLES);

        return response.data["response"];

    }

    export async function fetchCategories(): Promise<string> {

        let response = await axios.post(Links.FETCH_CATEGORIES);

        return response.data["response"];

    }

    export async function fetchCategory(category_id: number): Promise<string> {

        let response = await axios.post(Links.FETCH_CATEGORY, { category_id: category_id });

        return response.data["response"];

    }

    export async function fetchQuiz(): Promise<string> {

        let response = await axios.post(Links.FETCH_QUIZ_QUESTIONS);

        return response.data["response"];

    }

    export async function fetchArticlesByCategory(category_id: number): Promise<string> {

        let response = await axios.post(Links.FETCH_ARTICLES_BY_CATEGORY, { category_id: category_id });

        return response.data["response"];

    }

    export async function fetchImportantArticles(): Promise<Array<IBriefArticle>> {

        let response: AxiosResponse = await axios.post(Links.FETCH_IMPORTANT_ARTICLES);

        return response.data["response"];

    }

    export async function adminLogin(username: string, password: string): Promise<Codes> {

        let response: AxiosResponse = await axios.post(Links.ADMIN_PANEL_LOGIN, { username: username, password: password });

        return response.data["response"];

    }

}

export default APIWrapper;
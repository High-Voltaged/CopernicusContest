import { Links } from "../../app/links";
import axios, { AxiosError, AxiosRequestConfig, AxiosResponse } from "axios";
import IBriefArticle from "../../interfaces/brief_article";
import Codes from "../../app/codes";
import ICategory from "../../interfaces/category";
import IFullArticle from "../../interfaces/full_article";
import moment from "moment";
import IQuizRaw from "../../interfaces/quiz_raw";
import IQuizQuestion from "../../interfaces/quiz_question";

export namespace APIWrapper {

    export async function fetchDigest(): Promise<IBriefArticle[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_digest);

        return response.data["response"];

    }

    export async function fetchEditArticlesList(): Promise<IBriefArticle[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_edit_articles_list);

        return response.data["response"];

    }

    export async function fetchArticle(id: number, stealth: boolean): Promise<IFullArticle> {

        let response: AxiosResponse;

        if (stealth) {

            response = await axios.post(Links.fetch_article_stealth, { id: id });

        } else {

            response = await axios.post(Links.fetch_article, { id: id });;

        }

        let article: IFullArticle = response.data["response"];

        article[0].category = { id: article[0].category_id, name: article[0].category_name };

        delete article[0].category_id;
        delete article[0].category_name;

        article[0].timestamp = moment(article[0].timestamp).format('YYYY-MM-DD HH:mm:s');

        return article;

    }

    export async function fetchPopularArticles(): Promise<IBriefArticle[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_popular_articles);

        return response.data["response"];

    }

    export async function updateQuizQuestion(question: IQuizQuestion): Promise<Codes> {

        let response: AxiosResponse = await axios.post(Links.update_quiz_question, { question: question });

        return response.data["response"];

    }

    export async function fetchCategories(): Promise<ICategory[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_categories);

        return response.data["response"];

    }

    export async function fetchCategory(category_id: number): Promise<ICategory> {

        let response: AxiosResponse = await axios.post(Links.fetch_category, { category_id: category_id });

        return response.data["response"];

    }

    export async function fetchQuiz(): Promise<IQuizRaw[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_quiz_questions);

        return response.data["response"];

    }

    export async function fetchQuizEdit(): Promise<IQuizRaw[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_edit_quiz_questions);

        return response.data["response"];

    }

    export async function fetchArticlesByCategory(category_id: number): Promise<IBriefArticle[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_articles_by_category, { category_id: category_id });

        return response.data["response"];

    }

    export async function fetchImportantArticles(): Promise<IBriefArticle[]> {

        let response: AxiosResponse = await axios.post(Links.fetch_important_articles);

        return response.data["response"];

    }

    export async function adminLogin(username: string, password: string): Promise<Codes> {

        let response: AxiosResponse = await axios.post(Links.admin_panel_login, { username: username, password: password });

        return response.data["response"];

    }

    export async function validateSession(): Promise<Codes> {

        let response: AxiosResponse = await axios.post(Links.validate_session);

        return response.data["response"];

    }

}

export default APIWrapper;
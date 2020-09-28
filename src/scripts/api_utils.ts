import Links from "../../app/links";

export namespace Util {

    export async function POSTRequest(url, data): Promise<string> {

        return await fetch(url, {
            method: 'POST',
            mode: 'cors',
            cache: 'no-cache',
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/json',
            },
            redirect: 'follow',
            referrer: 'no-referrer',
            body: data,
        }).then(response => response.json());

    }

    // You can't overload the function in TS.. great
    export async function POSTRequest2(url): Promise<string> {

        return await fetch(url, {
            method: 'POST',
            mode: 'cors',
            cache: 'no-cache',
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/json',
            },
            redirect: 'follow',
            referrer: 'no-referrer',
        }).then(response => response.json());

    }

}

export namespace Wrapper {

    export async function fetchDigest(): Promise<string> {

        let digest_list = await Util.POSTRequest(Links.FETCH_DIGEST, "");

        return digest_list['response'];

    }

    export async function fetchArticle(id: number): Promise<string> {

        let article = await Util.POSTRequest(Links.FETCH_ARTICLE, JSON.stringify({ id: id }));

        return article['response'];

    }

    export async function fetchPopularArticles(): Promise<string> {

        let article = await Util.POSTRequest(Links.FETCH_POPULAR_ARTICLES, "");

        return article['response'];

    }

    export async function fetchCategories(): Promise<string> {

        let categories = await Util.POSTRequest(Links.FETCH_CATEGORIES, "");

        return categories['response'];

    }

    export async function fetchCategory(category_id: number): Promise<string> {

        let category = await Util.POSTRequest(Links.FETCH_CATEGORY, JSON.stringify({ category_id: category_id }));

        return category['response'];

    }

    export async function fetchQuiz(): Promise<string> {

        let quiz = await Util.POSTRequest(Links.FETCH_QUIZ_QUESTIONS, "");

        return quiz['response'];

    }

    export async function fetchArticlesByCategory(category_id: number): Promise<string> {

        let articles = await Util.POSTRequest(Links.FETCH_ARTICLES_BY_CATEGORY, JSON.stringify({ category_id: category_id }));

        return articles['response'];

    }

}

export default Wrapper;
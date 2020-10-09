import Queries from "../database/queries";
import Links from "./links";
import Utils from "./utils";
import { Request, Response } from "Express";

module.exports = function(app) {

    app.post(Links.FETCH_ARTICLE, async function(req: Request, res: Response) {

        await Queries.incrementArticleViewCount(req.body.id);

        res.json({
            response: await Queries.fetchArticle(req.body.id)
        });

    });

    app.post(Links.FETCH_ARTICLES, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchArticles()
        });
    });

    app.post(Links.FETCH_POPULAR_ARTICLES, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchArticlesByPopularity()
        });
    });

    app.post(Links.FETCH_IMPORTANT_ARTICLES, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchImportantArticles()
        });
    });

    app.post(Links.FETCH_ARTICLES_BY_CATEGORY, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchArticlesByCategory(req.body.category_id)
        });
    });

    app.post(Links.FETCH_DIGEST, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchDigest()
        });
    });

    app.post(Links.FETCH_CATEGORIES, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchCategories()
        });
    });

    app.post(Links.FETCH_CATEGORY, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchCategory(req.body.category_id)
        });
    });

    app.post(Links.FETCH_QUIZ_QUESTIONS, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchQuizQuestions()
        });
    });

    app.post(Links.ADMIN_PANEL_LOGIN, async function(req: Request, res: Response) {

        console.log(req.body);

        res.json({
            response: await Utils.processAdminLogin(res, req.body.username, req.body.password)
        });
        
    });

    app.post(Links.EDIT_ARTICLE, async function(req: Request, res: Response) {

        let cookies: Array<string> = req.headers.cookie.split("; ");

        let session_token: string;

        for (let cookie of cookies) {

            let cookie_split = cookie.split("=");

            if (cookie_split[0].toLowerCase() == "session-token") {

                session_token = cookie_split[1];
                
                return;

            }

        }

        await Utils.editArticle(res, req.body.article_id, req.body.new_title, req.body.new_content, session_token);

    });

};
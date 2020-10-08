import Queries from "../database/queries";
import Links from "./links";
import Util from "./util";
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

        await Util.processAdminLogin(res, req.body.username, req.body.password);

        res.json({
            response: await Queries.fetchQuizQuestions()
        });

    });

};
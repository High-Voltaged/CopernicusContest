import Queries from "../database/queries";
import { Links } from "./links";
import Utils from "./utils";
import { Request, Response } from "Express";

module.exports = function(app) {

    app.post(Links.fetch_article, async function(req: Request, res: Response) {

        await Queries.incrementArticleViewCount(req.body.id);

        res.json({
            response: await Queries.fetchArticle(req.body.id)
        });

    });

    app.post(Links.fetch_article_stealth, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.fetchArticleStealth(req.headers.cookie, req.body.id)
        });
    });

    app.post(Links.fetch_articles, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchArticles()
        });
    });

    app.post(Links.fetch_popular_articles, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchArticlesByPopularity()
        });
    });

    app.post(Links.fetch_important_articles, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchImportantArticles()
        });
    });

    app.post(Links.fetch_articles_by_category, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchArticlesByCategory(req.body.category_id)
        });
    });

    app.post(Links.fetch_digest, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchDigest()
        });
    });

    app.post(Links.fetch_categories, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchCategories()
        });
    });

    app.post(Links.fetch_category, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchCategory(req.body.category_id)
        });
    });

    app.post(Links.fetch_quiz_questions, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchQuizQuestions()
        });
    });

    app.post(Links.fetch_edit_quiz_questions, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchEditQuizQuestions()
        });
    });

    app.post(Links.fetch_edit_categories, async function(req: Request, res: Response) {
        res.json({
            response: await Queries.fetchEditCategories()
        });
    });

    app.post(Links.admin_panel_login, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.processAdminLogin(res, req.body.username, req.body.password)
        });
    });

    app.post(Links.edit_article, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.editArticle(req.headers.cookie, req.body.article_id, req.body.title, req.body.content, req.body.picture_link, req.body.important, req.body.category_id)
        });
    });

    app.post(Links.insert_article, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.insertArticle(req.headers.cookie, req.body.article.title, req.body.article.content, req.body.article.picture_link, req.body.article.important, req.body.article.category.id)
        });
    });

    app.post(Links.fetch_edit_articles_list, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.fetchEditArticleList(req.headers.cookie)
        });
    });

    app.post(Links.delete_article, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.deleteArticle(req.headers.cookie, req.body.article_id)
        });
    });

    app.post(Links.delete_quiz_question, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.deleteQuizQuestion(req.headers.cookie, req.body.question_id)
        });
    });

    app.post(Links.validate_session, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.validateSessionCode(req.headers.cookie)
        });
    });

    app.post(Links.update_quiz_question, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.updateQuizQuestion(req.headers.cookie, req.body.question)
        });
    });

    app.post(Links.insert_quiz_question, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.insertQuizQuestion(req.headers.cookie, req.body.question)
        });
    });

    app.post(Links.insert_category, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.insertCategory(req.headers.cookie, req.body.category_id, req.body.category_name)
        });
    });

    /*app.post(Links.edit_category, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.editCategory(req.headers.cookie, req.body.category_id)
        });
    });*/

    app.post(Links.delete_category, async function(req: Request, res: Response) {
        res.json({
            response: await Utils.deleteCategory(req.headers.cookie, req.body.category_id)
        });
    });


};
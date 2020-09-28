import Queries from "../database/queries";
import Links from "./links";

module.exports = function(app) {

    app.post(Links.FETCH_ARTICLE, async function(req, res) {

        await Queries.incrementArticleViewCount(req.body.id);

        res.json({
            response: await Queries.fetchArticle(req.body.id)
        });

    });

    app.post(Links.FETCH_ARTICLES, async function(req, res) {
        res.json({
            response: await Queries.fetchArticles()
        });
    });

    app.post(Links.FETCH_POPULAR_ARTICLES, async function(req, res) {
        res.json({
            response: await Queries.fetchArticlesByPopularity()
        });
    });

    app.post(Links.FETCH_ARTICLES_BY_CATEGORY, async function(req, res) {
        res.json({
            response: await Queries.fetchArticlesByCategory(req.body.category_id)
        });
    });

    app.post(Links.FETCH_DIGEST, async function(req, res) {
        res.json({
            response: await Queries.fetchDigest()
        });
    });

    app.post(Links.FETCH_CATEGORIES, async function(req, res) {
        res.json({
            response: await Queries.fetchCategories()
        });
    });

    app.post(Links.FETCH_CATEGORY, async function(req, res) {
        res.json({
            response: await Queries.fetchCategory(req.body.category_id)
        });
    });

    app.post(Links.FETCH_QUIZ_QUESTIONS, async function(req, res) {

        res.json({
            response: await Queries.fetchQuizQuestions()
        });

    });

};
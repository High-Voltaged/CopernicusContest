import database from "./database";

let connection;

export namespace Queries {

    export async function fetchArticle(id: number) {

        connection = await database.getConnection();
        //let result = await connection.query("SELECT a.*, b.name as author_name FROM articles a INNER JOIN authors b ON b.id = a.author_id WHERE a.id = ?;", [id]);
        let result = await connection.query("SELECT a.*, b.name as category_name FROM articles a INNER JOIN categories b ON b.id = a.category_id WHERE a.id = ?;", [id]);
        connection.end();
        return result;

    }

    export async function insertArticle(title: string, content: string, picture_link: string, important: number, category_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("INSERT IGNORE INTO `articles` (`title`, `content`, picture_link, `important`, `category_id`) VALUES (?, ?, ?, ?, ?)",
                                            [title, content, picture_link, important, category_id]);
        connection.end();
        return result;

    }

    export async function incrementArticleViewCount(id: number) {

        connection = await database.getConnection();
        let result = await connection.query("UPDATE `articles` SET `times_read` = `times_read` + 1 WHERE id = ?;", [id]);
        connection.end();
        return result;

    }

    export async function fetchArticles() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT `id`, `title`, `category_id`, `times_read`, `timestamp` FROM `articles`;", []);
        connection.end();
        return result;

    }

    export async function fetchArticlesByPopularity() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT `id`, `title`, `category_id`, `times_read`, `timestamp` FROM `articles` ORDER BY `times_read` DESC LIMIT 6;", []);
        connection.end();
        return result;

    }

    export async function fetchImportantArticles() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT `id`, `title`, `content`, `picture_link`, `timestamp` FROM `articles` WHERE `important` = true ORDER BY `times_read` DESC;", []);
        connection.end();
        return result;

    }

    export async function fetchArticlesByCategory(category_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("SELECT `id`, `title`, `times_read`, `timestamp` FROM `articles` WHERE `category_id` = ?;", [category_id]);
        connection.end();
        return result;

    }

    export async function fetchDigest() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT `id`, `title`, SUBSTRING(`content`, 1, 50) as `content`, `picture_link`, `times_read` FROM `articles` ORDER BY `id` DESC LIMIT 50;", []);
        connection.end();
        return result;

    }

    export async function fetchEditArticleList() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT `id`, `title`, SUBSTRING(`content`, 1, 25) as `content` FROM `articles` ORDER BY `id` DESC;", []);
        connection.end();
        return result;

    }

    export async function fetchCategories() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT * from `categories` ORDER by rand() LIMIT 5;", []);
        connection.end();
        return result;

    }

    export async function fetchCategory(category_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("SELECT * from `categories` WHERE id = ?;", [category_id]);
        connection.end();
        return result;

    }

    export async function fetchQuizQuestions() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT questions.id, questions.question, answers.id as answer_id, answers.answer, correct_answers.correct_answer_id FROM quiz_questions questions INNER JOIN quiz_answers answers ON questions.id = answers.question_id INNER JOIN quiz_correct_answers correct_answers ON answers.id = correct_answers.correct_answer_id ORDER by rand();", []);
        connection.end();
        return result;

    }

    export async function queryAdminByUsername(username: string) {

        connection = await database.getConnection();
        let result = await connection.query("SELECT * FROM `admins` WHERE `username` = ?;", [username]);
        connection.end();
        return result;

    }

    export async function insertSession(user_id: number, token: string) {

        connection = await database.getConnection();
        let result = await connection.query("INSERT INTO `sessions` (`user_id`, `token`) VALUES (?, ?)", [user_id, token]);
        connection.end();
        return result;

    }

    export async function querySession(session_token: string) {

        connection = await database.getConnection();
        let result = await connection.query("SELECT * FROM `sessions` WHERE `token` = ?", [session_token]);
        connection.end();
        return result;

    }

    export async function updateArticle(article_id: number, new_title: string, new_content: string) {

        connection = await database.getConnection();
        let result = await connection.query("UPDATE `articles` SET `title` = ?, `content` = ? WHERE `article_id` = ?", [new_title, new_content, article_id]);
        connection.end();
        return result;

    }

};

export default Queries;
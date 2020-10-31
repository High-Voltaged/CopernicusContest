import database from "./database";
import IQuizQuestion from "../interfaces/quiz_question";

let connection;

export namespace Queries {

    export async function fetchArticle(id: number) {

        connection = await database.getConnection();
        //let result = await connection.query("SELECT a.*, b.name as author_name FROM articles a INNER JOIN authors b ON b.id = a.author_id WHERE a.id = ?;", [id]);
        let result = await connection.query("SELECT a.*, b.name as category_name FROM articles a INNER JOIN categories b ON b.id = a.category_id WHERE a.id = ?;", [id]);
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
        let result = await connection.query("SELECT `id`, `title`, SUBSTRING(`content`, 1, 50) as `content`, `picture_link`, `times_read` FROM `articles` WHERE  `important` = 0 ORDER BY `id` DESC LIMIT 50;", []);
        connection.end();
        return result;

    }

    export async function fetchEditArticleList() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT `id`, `title`, SUBSTRING(`content`, 1, 25) as `content` FROM `articles` ORDER BY `id` DESC;", []);
        connection.end();
        return result;

    }

    export async function fetchEditCategories() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT *, (SELECT COUNT(*) FROM `articles` `a` WHERE `a`.`category_id` = `categories`.`id`) AS article_count FROM `categories` ORDER BY `id` DESC;", []);
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
        let result = await connection.query("SELECT questions.id as question_id, questions.question, answers.id AS answer_id, answers.answer, correct_answers.correct_answer_id FROM quiz_questions questions INNER JOIN quiz_answers answers ON questions.id = answers.question_id INNER JOIN quiz_correct_answers correct_answers ON questions.id = correct_answers.question_id ORDER by rand()", []);
        connection.end();

        return result;

    }

    export async function fetchEditQuizQuestions() {

        connection = await database.getConnection();
        let result = await connection.query("SELECT questions.id as question_id, questions.question, answers.id AS answer_id, answers.answer, correct_answers.correct_answer_id FROM quiz_questions questions INNER JOIN quiz_answers answers ON questions.id = answers.question_id INNER JOIN quiz_correct_answers correct_answers ON questions.id = correct_answers.question_id;", []);
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

    export async function insertArticle(title: string, content: string, picture_link: string, important: number, category_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("INSERT IGNORE INTO `articles` (`title`, `content`, picture_link, `important`, `category_id`) VALUES (?, ?, ?, ?, ?)",
            [title, content, picture_link, important, category_id]);
        connection.end();
        return result;

    }

    export async function insertCategory(category_name: string) {

        connection = await database.getConnection();
        let result = await connection.query("INSERT IGNORE INTO `categories` (`name`) VALUES (?)", [category_name]);
        connection.end();
        return result;

    }

    export async function updateCategory(category_id: number, category_name: string) {

        connection = await database.getConnection();
        let result = await connection.query("UPDATE `categories` SET `name` = ? WHERE `id` = ?", [category_name, category_id]);
        connection.end();
        return result;

    }

    export async function deleteCategory(category_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("DELETE IGNORE FROM `categories` WHERE `id` = ?", [category_id]);
        connection.end();
        return result;

    }

    export async function updateArticle(article_id: number, title: string, content: string, picture_link: string, important: number, category_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("UPDATE `articles` SET `title` = ?, `content` = ?, `picture_link` = ?, `important` = ?, `category_id` = ?, WHERE `id` = ?", [title, content, picture_link, important, category_id, article_id]);
        connection.end();
        return result;

    }

    export async function deleteArticle(article_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("DELETE FROM `articles` WHERE `id` = ?", [article_id]);
        connection.end();
        return result;

    }

    export async function deleteQuizQuestion(question_id: number) {

        connection = await database.getConnection();
        let result = await connection.query("DELETE FROM `quiz_questions` WHERE `id` = ?", [question_id]);
        connection.end();
        return result;

    }

    export async function updateQuizQuestion(question: IQuizQuestion) {

        connection = await database.getConnection();

        await connection.query("DELETE IGNORE FROM `quiz_answers` WHERE `question_id` = ?", [question.id]);

        await insertQuizQuestion(question);

        connection.end();

    }

    export async function insertQuizQuestion(question: IQuizQuestion) {

        connection = await database.getConnection();

        let question_result = await connection.query("INSERT INTO  `quiz_questions` (`question`) VALUES (?)", [question.question]);;

        for (let answer of question.answers) {

            let result = await connection.query("INSERT INTO  `quiz_answers` (`question_id`, `answer`) VALUES (?, ?)", [question_result.insertId, answer.answer]);

            if (question.correct_answer_id == answer.id) {

                await connection.query("INSERT INTO `quiz_correct_answers` (`question_id`, `correct_answer_id`) VALUES (?, ?)", [question_result.insertId, result.insertId]);

            }

        }

        connection.end();

    }

};

export default Queries;
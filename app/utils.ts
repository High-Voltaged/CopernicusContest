import * as bcrypt from "bcrypt"
import Queries from "../database/queries";
import { Response } from "Express";
import Codes from "./codes";
import crypto from "crypto";

const min_title_length: number = 3;
const max_title_length: number = 100;

const min_content_length: number = 100;
const max_content_length: number = 10000000;

export namespace Utils {

    function generateToken() {
        return crypto.randomBytes(64).toString('hex');
    }

    function validateArticleDetails(new_title: string, new_content: string) {

        return ( ( (new_title.length >= min_title_length) && (new_title.length <= max_title_length) ) &&
            ( (new_content.length >= min_content_length) && (new_content.length <= max_content_length) ) );

    }

    async function validateSession(session_token: string): Promise<boolean> {

        let result = Queries.querySession(session_token);

        if (result[0]) {

            return true;

        } else {

            return false;

        }

    }

    export async function processAdminLogin(res: Response, username: string, password: string): Promise<Codes> {

        let result = await Queries.queryAdminByUsername(username);

        if (!result[0]) {

            return Codes.ERROR;

        }

        if (await bcrypt.compare(password, result[0].password)) {

            let session_key: string = generateToken();

            await Queries.insertSession(result[0].id, session_key);

            res.cookie("session-token", session_key);

            return Codes.SUCCESS;

        }

    }

    export async function editArticle(res: Response, article_id: number, new_title: string, new_content: string, session_token: string): Promise<Codes> {

        if ((await validateSession(session_token)) && (validateArticleDetails(new_title, new_content))) {

            await Queries.updateArticle(article_id, new_title, new_content);

            return Codes.SUCCESS;

        } else {

            return Codes.ERROR;

        }

    }

};

export default Utils;
import * as bcrypt from "bcrypt"
import Queries from "../database/queries";
import { Response } from "Express";
import Codes from "../codes";
import crypto from "crypto";

export namespace Utils {

    function generateToken() {
        return crypto.randomBytes(64).toString('hex');
    }

    export async function processAdminLogin(res: Response, username: string, password: string): Promise<void> {

        let result = await Queries.queryAdminByUsername(username);

        if (!result[0]) {

            res.json({
                response: Codes.ERROR
            });

            return;

        }

        if (await bcrypt.compare(password, result[0].password)) {

            let session_key: string = generateToken();

            await Queries.insertSession(result[0].id, session_key);

            res.cookie("session-token", session_key);

            res.json({
                response: Codes.SUCCESS
            });

        }

    }

};

export default Utils;
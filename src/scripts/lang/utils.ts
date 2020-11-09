import { Lang } from "./lang";
import { LangEnum } from "./enum"

export namespace LangUtil {

    export function getLanguageCookie(): LangEnum {

        let cookies: string[] = document.cookie.split("; ");

        let language: number = 0;

        for (let cookie of cookies) {

            let cookie_split = cookie.split("=");

            if (cookie_split[0].toLowerCase() == "language") {

                language = parseInt(cookie_split[1]);

                // The enum returned a string for some reason...
                if (language == 0) {

                    return LangEnum.ENGLISH;

                } else {

                    return LangEnum.POLISH;

                }

            }

        }

        return LangEnum.NOT_FOUND;

    }

    export function getLanguage() {

        let language_enum: LangEnum = getLanguageCookie();

        switch (language_enum) {

            case LangEnum.ENGLISH:
                return Lang.English;
                break;

            case LangEnum.POLISH:
            case LangEnum.NOT_FOUND:
            default:
                return Lang.Polish;
                break;

        }

    }

    export function setLanguage(language: LangEnum): void {

        let cookie_string: string = "language=" + language;

        document.cookie = cookie_string;

    }

}
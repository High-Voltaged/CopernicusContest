import ICategory from "./category";
import IBaseArticle from "./base_article";

export default interface IFullArticle extends IBaseArticle {
    category: ICategory,
    content: string[],
}
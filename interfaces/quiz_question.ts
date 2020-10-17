import IQuizAnswer from './quiz_answer';

export default interface IQuizQuestion {
   id: number;
   question: string;
   answers: IQuizAnswer[];
   correct_answer_id: number;
   selected_answer: number;
}
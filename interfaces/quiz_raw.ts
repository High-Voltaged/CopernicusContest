// This interface is used for the raw quiz data from the database

export default interface IQuizRaw {
    question_id: number;
    question: string;
    answer_id: number;
    answer: string;
    correct_answer_id: number;
}
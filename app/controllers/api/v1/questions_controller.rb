class Api::V1::QuestionsController < ApiController
  
  # POST /resource/question

  def create
    @question = Question.new(question_params);
    if @question.save 
      render json: {
        message: "Question successfully created!"
      }
    else 
      render json: {
        errors: [ 
          "Creating new question failed!",
          @question.errors,
        ]
      }
  end


   # private

   def question_params
    params.permit(:category, :difficulty, :text, :answer1, :answer2, :answer3, :answer4, :correct_answer)
  end
end
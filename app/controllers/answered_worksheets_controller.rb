class AnsweredWorksheetsController < ApplicationController
  before_action :set_answered_worksheet, only: [:show, :edit, :update, :destroy]
  before_action :find_topic
  before_action :find_yearlevel
  before_action :find_worksheet
  before_action :compute_score, only: :save
  
  
  def index
    
  end

  def show
    @questionList = Array.new
    @numberList = Array.new
    @answerList = Array.new
    @studentanswerList = Array.new
    
    @worksheet.items.each do |j|
      @questionList.push(j.question)
      @answerList.push(j.answer)
      @numberList << j.number
    end
    @answered_worksheet.studentanswers.each do |k|
      @studentanswerList << k.studentinput
    end
    
      
  end

  def new
    @answered_worksheet = AnsweredWorksheet.new
    
    #@answered_worksheet.studentanswers.build
  
  end

  def edit
  end

  def create
    @answered_worksheet = @worksheet.answered_worksheets.new(answered_worksheet_params)
    #raise params.inspect
    
    @answered_worksheet.yearlevel_id = @yearlevel.id
    @answered_worksheet.topic_id = @topic.id
    @answered_worksheet.student_id = current_student.id
    @answered_worksheet.hps = @worksheet.items.count
    
    score = 0
        answerkey = Array.new
        inputs = Array.new
           
            for x in @worksheet.items.each do
               answerkey.push(x.answer)
            end
            
            for y in @answered_worksheet.studentanswers.each do
                inputs.push(y.studentinput)
            end
            
              answerkey.zip(inputs) do |answer, input|
                  if answer == input
                      score += 1
                  end
              end
       @answered_worksheet.correctanswer = score
    
    
    
    
    if @answered_worksheet.save
      redirect_to yearlevel_topic_worksheet_answered_worksheet_path(@yearlevel, @topic, @worksheet, @answered_worksheet, @student)
    else
      render :new
    end
    
  end

  def update
    respond_to do |format|
      if @answered_worksheet.update(answered_worksheet_params)
        format.html { redirect_to @answered_worksheet, notice: 'Answered worksheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @answered_worksheet }
      else
        format.html { render :edit }
        format.json { render json: @answered_worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answered_worksheet.destroy
    respond_to do |format|
      format.html { redirect_to answered_worksheets_url, notice: 'Answered worksheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  
  private
    def set_answered_worksheet
      @answered_worksheet = AnsweredWorksheet.find_by(id: params[:id])
    end
    
    def find_topic
        @topic = Topic.find(params[:topic_id])
    end 
    
    def find_yearlevel
      @yearlevel = Yearlevel.find(params[:yearlevel_id])
    end
    
    def find_worksheet
      @worksheet = Worksheet.find(params[:worksheet_id])
    end
    
    def find_student
      @student = current_user
    end

    def answered_worksheet_params
      params.require(:answered_worksheet).permit(:correctanswer, :hps, :dateanswered, studentanswers_attributes: [:studentinput])
    end
    
    def student_answer_params
      params.require()
    end
    
    
    
end

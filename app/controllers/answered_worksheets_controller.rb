class AnsweredWorksheetsController < ApplicationController
  before_action :set_answered_worksheet, only: [:show, :edit, :update, :destroy]
  before_action :find_topic
  before_action :find_yearlevel
  before_action :find_worksheet
  before_action :compute_score, only: :save
  
  
  def index
    
  end

  def show
  end

  def new
    @answered_worksheet = AnsweredWorksheet.new
    
    @answered_worksheet.studentanswers.build, url: yearlevel_topic_worksheet_answered_worksheets_path(@yearlevel, @topic, @worksheet)
  
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
      params.require(:answered_worksheet).permit(:correctanswer, :hps, :dateanswered, studentanswer_attributes: [:studentinput])
    end
    
    def student_answer_params
      params.require()
    end
    
    
    def compute_score
        score = 0
        answerkey = Array.new
        inputs = Array.new
    
       loop do
           
            for x in @worksheet.item.each do
               x.answer >>  answerkey
            end
            
            for y in self.studentanswers.each do
                y.answer >>  inputs
            end
            
            answerkey.zip(inputs).each do |answer, input|
                if answer == input
                    score++
                
                countitems += 1
                end
        self.correctanswer = score
       break if countitems == @worksheet.items.count
   end
       end 
    end
end

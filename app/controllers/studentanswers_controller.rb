class StudentanswersController < ApplicationController
  before_action :set_studentanswer, only: [:show, :edit, :update, :destroy]
  before_action :find_topic
  before_action :find_yearlevel
  before_action :find_worksheet
  before_action :find_answered_worksheet
  before_action :find_student

  def index
    @studentanswers = Studentanswer.all
  end

  def show
  end

  def new
    @studentanswer = Studentanswer.new
  end

  def edit
  end

  def create
    @studentanswer = Studentanswer.new(studentanswer_params)
    @studentanswer.answered_worksheets_id = @answered_worksheet.id
    @studentanswer.yearlevel_id = @yearlevel.id
    @studentanswer.topic_id = @topic.id
    @studentanswer.student_id = current_student.id
    
    respond_to do |format|
      if @studentanswer.save
        format.html { redirect_to @studentanswer, notice: 'Studentanswer was successfully created.' }
        format.json { render :show, status: :created, location: @studentanswer }
      else
        format.html { render :new }
        format.json { render json: @studentanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @studentanswer.update(studentanswer_params)
        format.html { redirect_to @studentanswer, notice: 'Studentanswer was successfully updated.' }
        format.json { render :show, status: :ok, location: @studentanswer }
      else
        format.html { render :edit }
        format.json { render json: @studentanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @studentanswer.destroy
    respond_to do |format|
      format.html { redirect_to studentanswers_url, notice: 'Studentanswer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_studentanswer
      @studentanswer = Studentanswer.find(params[:id])
    end
    
    def find_answered_worksheet
      @answered_worksheet = AnsweredWorksheet.find(params[:answered_worksheets_id])
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

    def studentanswer_params
      params.fetch(:studentanswer, {})
      #params.require(:studentanswer).permit(:studentinput)
    end
end

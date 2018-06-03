class WorksheetsController < ApplicationController
  #before_action :not_for_student, only: [:new, :create]
  before_action :set_worksheet
  before_action :find_topic
  before_action :find_yearlevel
  
  def index

  end
  
  def show

  end

  def new
    @worksheet = Worksheet.new
  end
  
  def create
    @worksheet = @topic.worksheets.new(worksheet_params)
    @worksheet.yearlevel_id = @yearlevel.id
      if teacher_signed_in?
          @worksheet.teacher_id = current_teacher.id
      elsif admin_signed_in?
          @worksheet.admin_id = current_admin.id
      end
    
      if @worksheet.save
        redirect_to yearlevel_topic_path(@yearlevel, @topic)
      else
        render :new
      end
  end

  
  
  def edit

  end
  
  def update
    @worksheet.items.each do |i|
      i.update(params.fetch(:item, {}))
    end
    @worksheet.update(worksheet_params)
      
    if @worksheet.save
      redirect_to yearlevel_topic_path(@yearlevel, @topic)
    else
      render :edit
    end
  end
  
  def destroy
    @worksheet.destroy
    respond_to do |format|
      format.html { redirect_to yearlevel_topic_path(@yearlevel, @topic), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_worksheet
        @worksheet = Worksheet.find_by(id: params[:id])
    end
    #finds year level of the topic
    def find_topic
        @topic = Topic.find(params[:topic_id])
    end 
    
    def find_yearlevel
      @yearlevel = Yearlevel.find(params[:yearlevel_id])
    end
    
    def worksheet_params
        params.require(:worksheet).permit(:title, :directions, items_attributes: [:number, :question, :answer])
    end
    
    
end
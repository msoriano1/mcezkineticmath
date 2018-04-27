class WorksheetsController < ApplicationController
  def yearlevel
  end

  def topic
  end
  
  def grade1
  end
  
  def index
    @worksheets = Worksheet.all
  end
  
  def show
  end

  def new
    @worksheets = Worksheet.new
  end
  
  def create
    @worksheet = Worksheet.new(worksheet_params)
    @worksheet.status = true
    
    if @worksheet.save
      redirect_to worksheets_path, notice: "Worksheet successfully added."
    else
      render :new
    end
  end
  
  def edit
  end
end

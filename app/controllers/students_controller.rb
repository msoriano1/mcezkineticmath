class StudentsController < ApplicationController
    def index
        @students = Student.all
    end
    
    def show
        @student = Student.find params[:susername]
    end
    
    def new
        @student = Student.new
    end
    
    def create
        @student = Student.new params[:student]
        if @student.save
            redirect_to :action => 'show', :id => @student.id
        else
            render :action => 'new'
        end
    end
end

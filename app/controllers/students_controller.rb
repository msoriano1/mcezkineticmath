class StudentsController < ApplicationController
    before_action :set_student, only: [:update, :edit, :destroy, :show]
    
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
        @student = Student.new(student_params)
        @student.status = true
        if @student.save
            redirect_to students_path, notice: "Student successfully added."
        else
            render :action => 'new'
        end
    end
    
    def edit
    end
    
    def destroy
        if @student.status == true
          @student.status = false
        else
          @student.status = true
        end
        
        if @student.save
            redirect_to students_path, notice: "Student successfully updated."
        end
    end
  
    private
    def student_params
      params.require(:student).permit!
    end
    
    def set_student
      @student = Student.find_by(id: params[:id])
      redirect_to students_path, notice: "Student not found." if @student.nil?
    end
    
    def authorize_admin
        return unless !current_user.admin?
        redirect_to root_path, alert: 'Admins only!'
    end
end
module ApplicationHelper
    def for_student
        student_signed_in? 
    end
    
    def for_admin
        admin_signed_in? 
    end
    
    def for_teacher
       teacher_signed_in? 
    end
end

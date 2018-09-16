class AddInvitableToStudentsTeachers < ActiveRecord::Migration
	def change
      add_column :teachers, :status, :boolean, default: true
	end
end

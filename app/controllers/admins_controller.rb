class AdminsController < ApplicationController
    def index
        @admins = Admin.all
    end
    
    def show
        @admin = Admin.find params[:susername]
    end
    
    def new
        @admin = Admin.new
    end
    
    def create
        @admin = Admin.new params[:teacher]
        if @admin.save
            redirect_to :action => 'show', :id => @admin.id
        else
            render :action => 'new'
        end
    end
end

class YearlevelsController < ApplicationController 
    before_action :set_yearlevel
    #activates helper method before any function
    def index
        @yearlevels = Yearlevel.all
    end
    
    def show

    end
    
    def new
        @yearlevel = Yearlevel.new
    end
    
    def create
        @yearlevel = Yearlevel.new params[:yearlevel]
        if @yearlevel.save
            redirect_to :action => 'show'#, :id => @yearlevel.id
        else
            render :action => 'new'
        end
    end
    
    
    private
    def set_yearlevel
        @yearlevel = Yearlevel.find_by(id: params[:id])
    end
    

    #helper method to find current year level
end

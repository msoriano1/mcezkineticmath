class TopicsController < ApplicationController
    before_action :set_topic
    before_action :find_yearlevel

    def index
        
    end
    
    def show

    end
    
    def new
        #@yearlevel = Yearlevel.find_by(id: params[:id])
        @topic = Topic.new
    end
    
    def create
        @topic = @yearlevel.topics.new(topic_params)
        @topic.save
        redirect_to yearlevel_path(@yearlevel)
    end
    
    private
    
    def set_topic
        @topic = Topic.find_by(id: params[:id])
    end
    
    def find_yearlevel
        @yearlevel = Yearlevel.find(params[:yearlevel_id])
    end 
    #finds year level of the topic
    
    
    def topic_params
        params.require(:topic).permit!
    end
    #passes on all parameters when creating topics
    
end

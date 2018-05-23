class BreadcrumbsController < ApplicationController
    include ActionView::Helpers::UrlHelper
include ActionView::Helpers::TagHelper
include ApplicationHelper

attr_accessor :parts, :separator, :prefix

def initialize_breadcrumb()
  @breadcrumb = Breadcrumb.new
  if(project_selected?)
    @breadcrumb.prefix = {:title => "Dashboard", :url => dashboard_project_path(selected_project())}
  end
end

def initialize(separator = nil, parts = [])
  self.separator = separator || "<img src=\"/images/stub_arrow_right.gif\" />"
  self.parts = parts
end

def add(title, url = nil)
  self.parts << {:title => title, :url => url}
end

def set_prefix(title, url)
  self.prefix = {:title => title, :url => url}
end

def to_s
  if(!self.parts.nil? and !self.parts.empty?)
    if(self.prefix.nil?)
      parts_with_prefix = self.parts
    else
      parts_with_prefix = [self.prefix] + self.parts
    end
  
    breadcrumb_html = []
    parts_with_prefix.each do |part|
      if(part[:url].nil? or part[:url].empty?)
        breadcrumb_html << "#{part[:title]}"
      else
        breadcrumb_html << link_to(part[:title], part[:url])
      end
    end
    return breadcrumb_html.join(" #{self.separator} ")
  end
  
def generate_breadcrumb(sprint, story = nil)
  @breadcrumb.add(sprint.name, project_sprint_path(project.id, sprint.id))
  if(!story.nil?)
    @breadcrumb.add(story.display_title, story_path(story))
  elsif(self.action_name != 'index')
    @breadcrumb.add('Stories', stories_path())
  end

  current_page = self.action_name == 'index' ? 'Stories' : self.action_name.humanize
  @breadcrumb.add(current_page)
end

end

end

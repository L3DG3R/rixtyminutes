class PagesController < ApplicationController
  def home
    @projects = Project.all
  end
  
  def search
    
  end
end

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @projects = current_user.projects
  end

  def show
    set_project
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    
    if @project.save
      redirect_to @project, notice: "Saved..."
    else
      render :new
    end    
  end

  def edit
    set_project
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Updated..."
    else
      render :edit
    end    
  end
  
  private 
    def set_project
      @project = Project.find(params[:id])
    end  
    
    def project_params
      params.require(:project).permit(:project_type, :platform_type, :content_type, :project_name, :summary, :launch_date, :active)
    end  
end

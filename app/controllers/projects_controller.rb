class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @projects = current_user.projects
  end

  def show
    @photos = @project.photos
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    
    if @project.save
      
      if params[:images]
        params[:images].each do |image|
          @project.photos.create(image: image)
        end  
      end
      
      @photos = @project.photos
      redirect_to edit_project_path(@project), notice: "Saved..."
    else
      render :new
    end    
  end

  def edit
    if current_user.id == @project.user.id
      @photos = @project.photos
    else
      redirect_to root_path, notice: "You don't have permission"
    end
  end  
    
  def update
    if @project.update(project_params)
      
      if params[:images]
        params[:images].each do |image|
          @project.photos.create(image: image)
        end  
      end
      
      redirect_to edit_project_path(@project), notice: "Updated..."
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

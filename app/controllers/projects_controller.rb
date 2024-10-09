class ProjectsController < ApplicationController
  def index
    if Project.none?
      redirect_to new_project_path
    else
      @projects = Project.all
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save ? (redirect_to projects_path) : (render new_project_path)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end

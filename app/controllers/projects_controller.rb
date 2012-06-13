class ProjectsController < ApplicationController
  def index
    @projects = Project.active
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find params[:id]
    @task = @project.tasks.build
  end

  def create
    @project = Project.create params[:project]
    if @project.valid?
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.delete!
    redirect_to projects_path
  end
end

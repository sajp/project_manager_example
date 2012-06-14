class TasksController < ApplicationController
  before_filter :find_project

  def index
  end

  def create
    @task = @project.add_task params[:task]
    if @task.errors.empty?
      redirect_to @project, :notice => "Successfully created task"
    else
      render 'projects/show'
    end
  end

  def destroy
    @project.delete_task params[:id]
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { render :json => {success: true} }
    end
  end

  private

  def find_project
    @project = Project.find params[:project_id]
  end


end

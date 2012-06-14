class TasksController < ApplicationController

  def create
    @project = Project.find params[:project_id]
    @task = @project.add_task params[:task]
    if @task.errors.empty?
      redirect_to @project, :notice => "Successfully created task"
    else
      render 'projects/show'
    end
  end

end

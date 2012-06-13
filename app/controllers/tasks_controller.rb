class TasksController < ApplicationController

  def create
    @project = Project.find params[:project_id]
    @task = @project.add_task params[:task]
    if @task
      redirect_to @project, :notice => "Successfully created task"
    else
      render @project
    end
  end

end

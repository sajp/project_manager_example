class TasksPresenter

  def initialize task
    @task = task
  end

  def to_json
    {:name => "s"}
  end

end

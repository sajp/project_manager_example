json.tasks @project.tasks do |json, task|
  json.id task.id
  json.name task.name
  json.start_date task.start_date
  json.end_date task.end_date
end

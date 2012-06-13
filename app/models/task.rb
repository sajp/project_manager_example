class Task < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date

  belongs_to :project
end

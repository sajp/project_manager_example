class Task < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date

  belongs_to :project

  validates_presence_of :name, :start_date, :end_date
  validates_format_of :start_date, :end_date, :with => /\d{4}-\d{2}-\d{2}/

  default_scope where("state IS NOT 'deleted'")

  def delete
    self.state = "deleted"
    save!
  end
end

class Task < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date

  belongs_to :project

  validates_presence_of :name
  validates_presence_of :start_date, :end_date, :message => "please enter a valid date(yyyy-mm-dd)"

  default_scope where("state IS NOT 'deleted'")

  def delete
    self.state = "deleted"
    save!
  end

end

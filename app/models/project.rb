class Project < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name

  scope :active, where(:deleted => nil)

  has_many :tasks, :dependent => :destroy

  def add_task attrs
    tasks.create attrs
  end

  def delete!
    self.deleted = true
    save!
  end
end

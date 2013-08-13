class Country < ActiveRecord::Base
  self.primary_key = :code
  attr_accessible :name, :code

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  has_many :currencies
  has_many :visits
  has_many :users, :through => :visits

  accepts_nested_attributes_for :currencies, :allow_destroy => true

end

class Visit < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  attr_accessible :user_id, :country_id
end

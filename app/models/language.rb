class Language < ActiveRecord::Base
  attr_accessible :name

  has_many :desired_languages
  has_many :users, through: :desired_languages
end

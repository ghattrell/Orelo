class DesiredLanguage < ActiveRecord::Base
  attr_accessible :language_id, :user_id

  belongs_to :languages 
  belongs_to :user 
end

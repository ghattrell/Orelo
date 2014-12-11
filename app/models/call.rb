class Call < ActiveRecord::Base
  attr_accessible :create, :destroy, :room, :user_id, :user2_id

  belongs_to :user
  belongs_to :phone_calls, :class_name => "User"
end

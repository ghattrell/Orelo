class Message < ActiveRecord::Base
  attr_accessible :content, :reciever_id, :sender_id

  belongs_to :user
  
  
end

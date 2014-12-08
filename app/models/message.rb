class Message < ActiveRecord::Base
  attr_accessible :content, :reciever_id, :sender_id
end

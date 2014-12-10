class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id" 
  has_many :recieved_messages, class_name: "Message", foreign_key: "reciever_id"
  has_many :desired_languages
  has_many :languages, :through => :desired_languages
end

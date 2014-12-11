class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :username, :email, :user_image, :dob, :gender, :native_language
  # attr_accessible :title, :body
  has_many :friendships
  
  has_many :friends, :through => :friendships
  
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id" 
  
  has_many :recieved_messages, class_name: "Message", foreign_key: "reciever_id"
  
  has_many :desired_languages
  
  has_many :languages, :through => :desired_languages

  has_many :calls, foreign_key: :user_id
  
  has_many :user2s, :through => :calls
  
  has_many :received_calls, :class_name => "Call", :foreign_key => "user2_id"
  
  has_many :inverse_user2s, :through => :recieved_calls, :source => :user


  def age
    Time.now.utc.to_date.year - self.dob.year if self.dob
  end

  def self.create_unique_token
    chars = [('a'..'z'), ('A'..'Z'), (1..26)].map { |i| i.to_a }.flatten
    room = string = (0..7).map { chars[rand(chars.length)] }.join

  end 

end

 
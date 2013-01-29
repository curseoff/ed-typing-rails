class Room < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  
  has_many :room_users
  has_many :users,  :through => :room_users
  
  attr_accessible :contents, :status, :title, :user_id
  
  validates :title,  :presence => true,:uniqueness=>true
  validates :contents,  :presence => true,:uniqueness=>true
  
  def self.public_rooms
    self.where(:status => 'public')
  end
  
  def number_of_people
    room_users.count
  end
end

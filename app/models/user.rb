class User < ActiveRecord::Base
  has_one :person
  has_many :rooms
  
  attr_accessible :uid, :provider
  
  def self.find_or_create_from_auth_hash(auth_hash)
    user_data = auth_hash.extra.raw_info
    if user = User.where(:uid => user_data.id).first
      user
    else
      user = User.create!(:uid => user_data.id, :provider => 'facebook')
    end
    
    person = user.person
    if person.blank?
      user.create_person(:data => auth_hash.to_json)
    else
      person.update_attributes(:data => auth_hash.to_json)
    end
      
    user
  end

  def name 
    person.name
  end
  
  def profile
    person.profile
  end
  
  def token
    self.profile["credentials"]["token"]
  end
  
  def friends
    @graph ||= Koala::Facebook::API.new(self.token)
    @graph.get_connections("me", "friends")
  end
  
  def myrooms
    self.rooms.order("updated_at desc").reload
  end
  
  def entering_rooms
    Room.joins(:room_users).where(:user_id => self.id)
  end
end

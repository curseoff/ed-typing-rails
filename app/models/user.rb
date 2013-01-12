class User < ActiveRecord::Base
  has_one :person
  
  attr_accessible :uid, :provider
  
  def self.find_or_create_from_auth_hash(auth_hash)
    user_data = auth_hash.extra.raw_info
    if user = User.where(:uid => user_data.id).first
      user
    else
      user = User.create!(:uid => user_data.id, :provider => 'facebook')
    end
    
    if user.person.blank?
      user.create_person(:data => auth_hash.to_json)
    end
    
    user
  end  
end

class Person < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :data, :user_id
  
  def profile
    if @profile.blank?
      @profile = JSON.parse(self.data)
    end
    
    @profile
  end
  
  def name
    profile["info"]["name"]
  end
end

class Item < ActiveRecord::Base
  belongs_to :investment
  validates :symbol, :presence => true


  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  
  def editable_by?(user)
    user && user == owner
  end

end

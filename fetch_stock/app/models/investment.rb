class Investment < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_many :items
  validates :title, :presence => true

  def editable_by?(user)
    user && user == owner
  end

end

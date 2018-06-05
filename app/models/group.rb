class Group < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
         
  def email_required?
    false
  end

  def email_changed?
    false
  end

  has_many :user_groups
  has_many :users, :through => :user_groups
end

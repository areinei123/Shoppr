class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :groups, through: :memberships

  def full_name
    first_name + " " + last_name
  end

  def in_group?(group)
    groups.include?(group)
  end

  def authenticated?
    true
  end
end

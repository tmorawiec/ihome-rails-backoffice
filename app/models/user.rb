class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # User default permision policy is 1 - so he dont have any rights
  belongs_to :permission_policy, default: -> { PermissionPolicy.first }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
end

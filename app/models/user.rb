class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # User default permision policy is 1 - so he dont have any rights
  belongs_to :permission_policy, default: -> { PermissionPolicy.first }
  has_many :histories



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

         
         def jwt_payload
          { 
            'email' => email,
            'admin' => admin,
            'permission_policy' => permission_policy.attributes,
          }
        end



end

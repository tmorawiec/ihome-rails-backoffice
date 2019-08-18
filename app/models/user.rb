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
      user: {
        username: email,
        admin: admin,
        permission_policy: {
          room: permission_policy.io1,
          bedroom: permission_policy.io2,
          kitchen: permission_policy.io3,
          bathroom: permission_policy.io4
        }
      }
    }
  end


  def after_sign_in_path_for(resource)
    current_user_path
  end


end

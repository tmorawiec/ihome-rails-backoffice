class History < ApplicationRecord
  belongs_to :switch
  belongs_to :user

  def user_name
    user.email
  end

  def as_json(*)
    super.slice("value", "timeStamp").tap do |hash|
      hash[user.class.name.downcase] = user.email
      hash[switch.class.name.downcase] = switch.name

    end
  end

end

class Switch < ApplicationRecord
    has_many :histories



    def as_json(params)
        super.except("created_at", "updated_at").tap do |hash|
            hash['state'] = histories.last
            if params[:history] == "true"
                hash['history'] = histories.limit(params[:limit]).order(created_at: :desc)
            end

        end
    end

end

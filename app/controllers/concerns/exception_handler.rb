module ExceptionHandler
    # provides the more graceful `included` method
    extend ActiveSupport::Concern

    included do
        rescue_from ActiveRecord::RecordNotFound do |e|
        if(Rails.env.production?)
            json_response({ message: "Resource Not Found" }, :not_found)
        else
            json_response({ message: e.message }, :not_found)
        end
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
            if(Rails.env.production?)
                json_response({ message: "Unprocessable Entity" }, :unprocessable_entity)
            else
                json_response({ message: e.message }, :unprocessable_entity)
            end
        end
    end
end
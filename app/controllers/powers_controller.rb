class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid
    def index
        powers=Power.all
        render json: powers, status: :ok
    end
    def show
        power=Power.find(params[:id])
        render json: power, status: :ok
    end
    def update
        power=Power.find(params[:id])
        power.update!(power_params)
        render json: power, status: :accepted
    end
    private
    def rescue_from_not_found
        render json: {error: 'Power not found'}, status: :not_found
    end
    def power_params
        params.permit(:description)
    end
    def rescue_from_record_invalid(invalid)
        render json: {errors:invalid.record.errors.full_messages},status: :unprocessable_entity
    end
end

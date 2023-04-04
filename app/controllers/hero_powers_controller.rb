class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid
    def create
        hero_power=HeroPower.create!(hero_powers_params)
        if hero_power
            hero=Hero.find(params[:hero_id])
            render json: hero,include: ['powers'], status: :created
        end
    end
    
    private
    def hero_powers_params
        params.permit(:strength, :power_id, :hero_id)
    end
    def rescue_from_record_invalid(invalid)
        render json: {errors:invalid.record.errors.full_messages},status: :unprocessable_entity
    end
end

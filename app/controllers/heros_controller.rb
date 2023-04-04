class HerosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found
    def index
        heros=Hero.all
        render json: heros, status: :ok
    end
    def show
        hero=Hero.find(params[:id])
        render json: hero, include: ['powers'], status: :ok
    end
    private
    def rescue_from_not_found
        render json: {error: 'Hero not found'}, status: :not_found
    end
end

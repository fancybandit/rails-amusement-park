class AttractionsController < ApplicationController

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.new(attraction_params)
        if attraction.save
            redirect_to attraction_path(attraction.id)
        else
            redirect_to root_path
        end
    end

    def edit
        find_attraction
    end

    def update
        find_attraction
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction.id)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def find_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

end
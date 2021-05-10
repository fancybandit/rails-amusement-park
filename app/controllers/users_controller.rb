class UsersController < ApplicationController

    def show
        redirect_if_not_logged_in
        find_user
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            redirect_to root_path
        end
    end

    def ride
        find_user
        find_ride
        if (@user.height.to_i < @ride.min_height) && (@user.tickets.to_i < @ride.tickets)
            flash[:message] = "You are not tall enough to ride the #{params[:ride]} AND You do not have enough tickets to ride the #{params[:ride]}"
        elsif @user.height.to_i < @ride.min_height
            flash[:message] = "You are not tall enough to ride the #{params[:ride]}"
            @user.update(happiness: (@user.happiness.to_i - 1).to_s)
        elsif @user.tickets.to_i < @ride.tickets
            flash[:message] = "You do not have enough tickets to ride the #{params[:ride]}"
            @user.update(happiness: (@user.happiness.to_i - 1).to_s)
        else
            @user.update(tickets: (@user.tickets.to_i - @ride.tickets).to_s)
            flash[:message] = "Thanks for riding the #{params[:ride]}!"
            @user.update(happiness: @ride.happiness_rating.to_s)
        end
        redirect_to user_path(@user.id)
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def find_ride
        @ride = Attraction.find_by(name: params[:ride])
    end

end
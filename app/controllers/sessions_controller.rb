class SessionsController < ApplicationController

    def create
        user = User.find_by(id: session_params[:user_id])
        if user && user.authenticate(session_params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            if user
                flash[:error] = "Invalid password."
            else
                flash[:error] = "Invalid username and password."
            end
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def session_params
        params.require(:user).permit(:user_id, :password)
    end

end
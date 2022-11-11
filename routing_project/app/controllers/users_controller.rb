class UsersController < ApplicationController
    def index
        # render plain: "I'm in the index action!"
        if params[:username]
            # users = User.find_by(username: params[:username])
            users = User.where("username = '#{params[:username]}'")
            users = User.all if users.empty?
        else
            users = User.all
        end
        render json: users
    end

    def create
        # render json: params
        user = User.new(user_params)
         # replace the `user_attributes_here` with the actual attribute keys
        # user.save!
        if user.save
            render json: user
          else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        # render json: params
        # params id finds the id number we are giving
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end

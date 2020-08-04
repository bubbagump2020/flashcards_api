class UsersController < ApplicationController

    # Working in Postman
    def index
        users = User.all
        render json: { users: users.as_json(except: :password_digest)}
    end
    
    # Working in Postman
    def create
        user = User.new(user_params)
        if user.save
            render json: {user: user.as_json(except: :password_digest)}
        else
            render json: { message: user.errors.full_message }
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :email,
            :name,
            :password
        )
    end
end
class UsersController < ApplicationController

    # Postman and RSpec tested
    def index
        users = User.all
        render json: { users: users.as_json(except: :password_digest)}
    end
    
    # Postman tested
    def create
        user = User.new(user_params)
        if user.save
            render json: {user: user.as_json(except: :password_digest)}
        else
            render json: { message: user.errors.full_message }
        end
    end

    # Postman tested
    def update
        user = User.find_by_id(params[:id])
        if user.update(user_params)
            render json: { user: user.as_json(except: :password_digest), message: "Updated!" }
        else
            render json: { message: user.errors.full_messages }
        end
    end

    # Postman tested
    def destroy
        user = User.find_by_id(params[:id])
        if user.delete
            render json: { message: "User deleted" }
        else
            render json: { message: user.errors.full_messages }
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
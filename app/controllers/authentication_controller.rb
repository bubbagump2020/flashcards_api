class AuthenticationController < ApplicationController

    def login
        user = User.find_by_name(login_params[:name])
        if user.authenticate(login_params[:password])
            token = JWT.encode( { id: user.id }, 'asdljasldkfjs', 'HS256')
            render json: { success: true, user: user.as_json(except: :password_digest), token: token}
        else
            render json: { success: false, message: "Username or password is incorrect" }
        end
    end

    private

    def login_params
        params.require(:user).permit(:name, :password)
    end

end
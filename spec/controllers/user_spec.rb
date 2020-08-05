require 'rails_helper'

user = {

}

RSpec.describe "Users", type: :request do 
    describe "GET users" do
        user = User.create(            
            name: 'kevin',
            email: 'kevin@gmail.com',
            password_digest: 'password',
            password: 'password'
        )
        it "gets all users" do
            get users_path
            expect(response).to be_successful
            expect(response.body).to include("kevin")
        end     
    end
    # Tested in Postman
    # describe "POST users" do
    #     thisUser = User.create({
    #             name: 'kevin',
    #             email: 'kevin@gmail.com',
    #             password_digest: 'password',
    #             password: 'password'
    #     })
    #     it "creates a user" do
    #         post users_path
    #         expect(response).to be_successful
    #     end
    # end
end
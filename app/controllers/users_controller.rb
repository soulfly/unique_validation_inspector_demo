class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index

   @users = User.all

   render json: @users.to_json

 end

 def create
   @user = User.new(user_params)

  #  unless @user.valid?
  #    render json: {
  #      status: 422,
  #      message: "Validation error",
  #      errors: @user.errors
  #    }.to_json
  #    return
  #  end

   begin
     @user.save!
     render json: {
       status: 200,
       message: "Created"
     }.to_json
   rescue ActiveRecord::RecordNotUnique => e
     render json: {
      status: 422,
      message: "Validation error: login has already been taken",
    }.to_json
   end

 end

 private

 def user_params
   params.require(:user).permit(:login)
 end

end

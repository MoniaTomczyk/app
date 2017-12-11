class UsersController < ApplicationController
   def index
  #  @users = User.all

   @users = User.page(params[:page]).per(30)

   end

   def show
    @user = User.find(params[:id])
   end
 end
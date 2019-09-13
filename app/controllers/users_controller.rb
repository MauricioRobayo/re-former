# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
    @user.email = 'patito@patito.com'
    warn "*************\n#{@user.inspect}\n***************"
  end

  def create
    warn "\n\n>>> Create <<<\n#{params}\n\n"
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    warn "*************\n#{@user.inspect}\n***************"
    if @user.save
      redirect_to new_user_path
    else
      warn "****** Can't save: #{@user.valid?}\n#{@user.errors.messages}\n\n"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

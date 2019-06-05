class SessionsController < ApplicationController
  def new 
    @user = User.new
    render :new
  end

  def create  
    @user = User.find_by_credential(params[:user][:username], params[:user][:password])
    if @user 
      
    else
      render :new
    end
  end

  def destroy

  end
end
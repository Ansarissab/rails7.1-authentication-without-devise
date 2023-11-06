class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)

    if @user.save
      flash[:notice] = 'User created successfully.'
      login(@user)
      redirect_to root_path
    else
      flash[:alert] = 'User not created.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end

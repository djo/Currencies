class ProfilesController < ApplicationController
  before_filter :load_user

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to edit_profile_url, :notice  => "Successfully updated profile."
    else
      render :action => 'edit'
    end
  end

  private

  def load_user
    @user = current_user
  end
end

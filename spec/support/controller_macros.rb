module ControllerMacros
  def login_user
    @user = Factory(:user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @user
  end
end

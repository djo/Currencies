module ControllerMacros
  def should_deny_unauthenticated_user(&block)
    it "should deny an unauthenticated user" do
      instance_eval &block
      response.should redirect_to(new_user_session_url)
    end
  end
end

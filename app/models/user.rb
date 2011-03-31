class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  protected

  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end

class User < ActiveRecord::Base
  has_many :appointments, :dependent => :destroy
  has_many :countries, :through => :appointments
  has_many :trips, :dependent => :destroy

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  # TEST IT
  accepts_nested_attributes_for :appointments, :allow_destroy => true, :reject_if => :all_blank

  protected

  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end

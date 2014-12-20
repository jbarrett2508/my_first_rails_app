class User < ActiveRecord::Base
  has_one :profile
  has_secure_password(validations:false)

  validates_confirmation_of :password, if: lambda { |m| !m.omniauth? && m.password.present? }
  validates_presence_of :password, :on => :create, if: lambda { |m| !m.omniauth? }
  validates_presence_of :password, if: lambda { |m| !m.omniauth? && m.password.present? }

  def needs_verification!
    update_attributes!(
      token: SecureRandom.urlsafe_base64,
      verified_email: false
    )
    UserNotifier.signed_up(self).deliver
  end
end

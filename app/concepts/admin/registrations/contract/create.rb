module Admin::Registrations::Contract
  class Create < Reform::Form
    include Reform::Form::ActiveModel::ModelReflections
    properties :email, :password, :password_confirmation

    validates :email, presence: true
    validates :password, presence: true, if: -> { self.email.present? }
    validates :password_confirmation, presence: true, if: -> { self.password.present? }

    validate :check_password, if: -> { password.present? && password_confirmation.present? }

    def check_password
      if password != password_confirmation
        errors.add(:passwords, "not same")
      end
    end
  end
end

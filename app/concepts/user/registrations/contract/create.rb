module User::Registrations::Contract
  class Create < Reform::Form
    include Reform::Form::ActiveModel::ModelReflections
    properties :email, :password, :password_confirmation

    validates :email, presence: true

    validate :check_password

    def check_password
      if password != password_confirmation
        errors.add(:password, "password not same")
      end
    end
  end
end

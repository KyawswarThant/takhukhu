module User::Registrations::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :model
      step self::Contract::Build(constant: User::Registrations::Contract::Create)

      def model(options, **)
        options[:model] = User.new
      end
    end

    step Subprocess(Present)
    step self::Contract::Validate(key: :user)
    step self::Contract::Persist()
  end
end

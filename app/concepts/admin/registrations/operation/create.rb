module Admin::Registrations::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :model
      step self::Contract::Build(constant: Admin::Registrations::Contract::Create)

      def model(options, **)
        options[:model] = Admin.new
      end
    end

    step Subprocess(Present)
    step self::Contract::Validate(key: :admin)
    step self::Contract::Persist()
  end
end

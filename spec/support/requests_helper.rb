module Requests
  module ApiHelper
    def json
      @json ||= JSON.parse(response.body)
    end

    # Keeps an object on the example group which can be used as a static
    # subject. Useful when tests in a group use the same state.
    def persistent_subject(&block)
      example.example_group.class_eval do
        @persistent_subject ||= block.call
      end
      example.example_group.instance_variable_get :@persistent_subject
    end
  end
end

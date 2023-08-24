require 'date'

module Attributor
  class Date
    include Temporal

    def self.native_type
      ::Date
    end

    def self.example(context = nil, options: {})
      load(Faker::Date.in_date_period, context)
    end

    def self.load(value, context = Attributor::DEFAULT_ROOT_CONTEXT, **_options)
      return value if value.is_a?(native_type)
      return nil if value.nil?

      return value.to_date if value.respond_to?(:to_date)

      case value
      when ::String
        begin
          ::Date.parse(value)
        rescue ArgumentError
          raise Attributor::DeserializationError.new(context: context, from: value.class, encoding: 'Date', value: value)
        end
      else
        raise CoercionError.new(context: context, from: value.class, to: self, value: value)
      end
    end

    def self.json_schema_string_format
      :date
    end
  end
end

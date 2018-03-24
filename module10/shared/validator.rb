require "byebug"
module Validator

  module ClassMethods
    def validate (attribute, rule_name, details = nil)
      instance_variable_set(:@rules, []) unless instance_variable_defined?(:@rules)

      validation = {
        attribute: attribute,
        rule_name: rule_name,
        details: details 
      }

      instance_variable_get(:@rules) << validation
    end
  end

  module InstanceMethods
    def validate!
      validations = self.class.instance_variable_get(:@rules)

      validations.each do |validation|
        rule = validation[:rule_name]
        attribute_value = instance_variable_get("@#{validation[:attribute]}")

        self.send(rule, validation, attribute_value)
      end
    end

    def valid?
      validate!
    rescue StandardError
      false
    end
  end

  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  private 

  def presence(validation, value)
    attribute_name = validation[:attribute]

    raise "#{attribute_name} не может быть пустым" if value.nil? || value.length.zero?
  end

  def format(validation, value)
    required_format = validation[:details]
    attribute_name = validation[:attribute]

    raise "#{attribute_name} неверного формата" if required_format.match(value).nil?
  end

  def type(validation, value)
    attribute_name = validation[:attribute]

    raise "#{attribute_name} неверного типа" if validation[:details] != value.class
  end
end

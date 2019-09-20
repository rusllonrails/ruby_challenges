#
# 09: ActiveModel without Rails: Validations module
#
# This module allow to have validations in your model.
#
# Supported validations:
#
#   - before_validation
#   - before_save
#
# EXAMPLE:
#
#   class Person < ActiveModel
#     ATTRS = %w(
#       first_name
#       last_name
#       age
#     )
#
#     attr_accessible *ATTRS
#
#     validates :first_name, :last_name, :age, presence: true
#     validates :age, numericality: true
#   end
#
#  nick = Person.new
#
#  nick.first_name = 'Nick'
#  nick.valid?
#
#    => false
#
#  nick.errors
#
#    => {last_name: 'can\'t be blank!'}
#
#  nick.last_name = 'Brandon'
#  nick.age = 'not number'
#  nick.valid?
#
#    => false
#
#  nick.errors
#
#    => {age: 'should be number!'}
#
#  nick.age = 19
#  nick.valid?
#
#    => true
#

module Validations
  SUPPORTED_VALIDATIONS = %w(
    presence
    numericality
  )

  def self.included(base)
    attr_reader :errors

    base.include(InstanceMethods)
    base.extend(ClassMethods)
  end

  module InstanceMethods
    def valid?
      @errors = {}

      SUPPORTED_VALIDATIONS.map do |validation_name|
        send("apply_#{validation_name}_validation")
      end

      !@errors.any?
    end

    def apply_presence_validation
      self.class.class_variable_get('@@presence_validation_list').map do |attribute|
        unless send(attribute)
          add_error(attribute, 'can\'t be blank!')
        end
      end
    end

    def apply_numericality_validation
      self.class.class_variable_get('@@numericality_validation_list').map do |attribute|
        val = send(attribute)

        if val && !val.is_a?(Numeric)
          add_error(attribute, 'should be number!')
        end
      end
    end

    def add_error(attribute, value)
      current_val = @errors[attribute]

      new_val = if current_val
                  current_val << value
                else
                  [value]
                end

      @errors[attribute] = new_val
    end

    private :apply_presence_validation,
            :apply_numericality_validation,
            :add_error
  end

  module ClassMethods
    def validates(*args, options)
      target_list = args

      options.map do |k, v|
        target_var_name = "@@#{k}_validation_list"

        if class_variable_defined?(target_var_name)
          current_list = class_variable_get(target_var_name)
          target_list += current_list if current_list
        end

        class_variable_set(target_var_name, target_list.uniq)
      end
    end

    private :validates
  end
end

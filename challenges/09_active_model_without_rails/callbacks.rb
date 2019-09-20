#
# 09: ActiveModel without Rails: Callbacks module
#
# This module allow to have callbacks in your model.
#
# Supported callbacks:
#
#   - before_validation
#   - before_save
#
# EXAMPLE:
#
#   class Person < ActiveModel
#     attr_accessible :first_name
#
#     before_validation :strip_attributes!
#     before_save :set_timestamp!
#   end
#
#   nick = Person.new
#
#   nick.first_name = ' Brandon '
#   nick.save
#
#   nick.first_name
#
#     => ' Brandon '
#
#   nick.updated_at
#
#     => 2019-09-19 19:14:22 +0300
#

module Callbacks
  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module InstanceMethods
    def valid?
      run_before_validation_callbacks

      super
    end

    def save
      run_before_save_callbacks

      super
    end

    def run_before_validation_callbacks
      run_callback_methods('@@before_validation_methods')
    end

    def run_before_save_callbacks
      run_callback_methods('@@before_save_methods')
    end

    def run_callback_methods(klass_variable_name)
      self.class.class_variable_get(klass_variable_name).map do |method_name|
        send(method_name)
      end
    end

    private :run_before_validation_callbacks,
            :run_before_save_callbacks,
            :run_callback_methods
  end

  module ClassMethods
    def before_validation(*methods_to_run)
      class_variable_set('@@before_validation_methods', methods_to_run)
    end

    def before_save(*methods_to_run)
      class_variable_set('@@before_save_methods', methods_to_run)
    end

    private :before_validation,
            :before_save
  end
end

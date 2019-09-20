#
# 09: ActiveModel without Rails: Attr accessible module
#
# This module allow to use virtual attributes for model.
#
# EXAMPLE:
#
#   class Person < ActiveModel
#     attr_accessible :first_name, :age
#   end
#
#   nick = Person.new
#
#   nick.first_name = 'Brandon'
#   nick.age = 18
#
#   nick.age
#
#     => 18
#

module AttrAccessible
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attr_accessible(*args)
      args.map do |arg|
        define_method(arg) { instance_variable_get("@#{arg}") }
        define_method("#{arg}=") do |value|
          instance_variable_set("@#{arg}", value)
        end
      end
    end

    private :attr_accessible
  end
end

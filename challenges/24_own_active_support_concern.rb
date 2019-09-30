# frozen_string_literal: true

#
# 24: Own ActiveSupport::Concern
#
# BRIEF:
#
#   In this challenge need to imagine that you have no Rails
#   and implement simple ActiveSupport::Concern module.
#
# EXAMPLE:
#
# module Custom
#   include ActiveSupport::Concern
#
#   in_class do
#     attr_accessor :foo, :bar
#   end
#
#   class_methods do
#     def test_class_method
#       'Class method here'
#     end
#   end
# end

# class Pet
#   include Custom
# end

# pet = Pet.new
#
# pet.instance_methods(false)
#   => [:bar=, :foo, :bar, :foo=]
#
# pet.class.methods.include?(:test_class_method)
#   => true
#

module ActiveSupport
  module Concern
    def self.included(mod)
      mod.extend(ClassMethods)
    end

    module ClassMethods
      def included(base)
        base.class_eval &@included_block

        const_set(:ClassMethods, Module.new)
        const_get(:ClassMethods).module_eval &@class_methods_block

        base.extend(const_get(:ClassMethods))
      end

      def in_class(&block)
        @included_block = block
      end

      def class_methods(&block)
        @class_methods_block = block
      end
    end
  end
end

module Custom
  include ActiveSupport::Concern

  in_class do
    attr_accessor :foo, :bar
  end

  class_methods do
    def test_class_method
      'Class method here'
    end
  end
end

Pet = Class.new do
  include Custom
end

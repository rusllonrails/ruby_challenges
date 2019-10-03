# frozen_string_literal: true

#
# 28: Own Struct class
#
# BRIEF:
#
#   Create a class named ConStruct that replicates the Struct class's behavior.
#   It should create/define a new class with properties and accessors
#   that were passed in to its initializer.
#
#   Also it should allow passing a block to initializer and define methods of the class.
#
# EXAMPLE:
#
#   Product = OwnStruct.new(:id, :title, :color) do
#     def title_and_color
#       "#{title} with '#{color}' color"
#     end
#   end
#
#   kiwi = Product.new(1, 'kiwi', 'green')
#
#   kiwi.title
#     => 'kiwi'
#
#   kiwi.title_and_color
#     => 'green'
#
#   kiwi.color = 'yellow'
#   kiwi.color
#     => 'yellow'
#
#   kiwi[:color] = 'red'
#   kiwi[:color]
#     => 'red'
#

class OwnStruct
  def self.new(*parameters, &block)
    klass = Class.new do
      @parameters = parameters
      attr_accessor *parameters

      def initialize(*values)
        values.each_with_index do |value, index|
          send("#{self.class.parameters[index]}=", value)
        end
      end

      def [](key)
        send(key)
      end

      def []=(key, value)
        send("#{key}=", value)
      end

      def self.parameters
        @parameters
      end
    end

    klass.class_eval &block
    klass
  end
end

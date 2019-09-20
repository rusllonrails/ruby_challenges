# frozen_string_literal: true

require './challenges/09_active_model_without_rails/attr_accessible'
require './challenges/09_active_model_without_rails/validations'
require './challenges/09_active_model_without_rails/persistance'
require './challenges/09_active_model_without_rails/callbacks'

#
# 09: ActiveModel without Rails
#
# BRIEF:
#
#   Imagine that you do not have ActiveModel class.
#   Write your own, which provides:
#
#   - virtual attributes (eg: attr_accessible *args)
#   - validations (eg: validates *args, presence: true, numericality: true)
#   - callbacks (eg: before_validation, before_save)
#
# EXAMPLE:
#
# class Person < ActiveModel
#   ATTRS = %w(
#     first_name
#     last_name
#     age
#   )
#
#   attr_accessible *ATTRS
#   attr_reader :updated_at
#
#   validates :first_name, :last_name, :age, presence: true
#   validates :age, numericality: true
#
#   before_validation :strip_attributes!
#   before_save :set_timestamp!
# end
#
# nick = Person.new
#
# nick.first_name = 'Nick'
# nick.valid?
#
#   => false
#
# nick.errors
#
#   => {last_name: 'can\'t be blank!'}
#
# nick.last_name = 'Brandon'
# nick.age = 'not number'
# nick.valid?
#
#   => false
#
# nick.errors
#
#   => {age: 'should be number!'}
#
# nick.age = 19
# nick.valid?
#
#   => true
#
# nick.save
#
#   => #<Person:0x0000559f68976b40 @first_name="John", @last_name="Doe", @age=18,
#      @updated_at=2019-09-19 19:14:22 +0300, @code="xY73jK">
#
# NOTE:
#
#   In this challenge I'm not going to implement Persistance related stuff,
#   I added Persistance module - just for easier testing of 'before_save' callback.
#

class ActiveModel
  include AttrAccessible
  include Validations
  include Persistance
  include Callbacks
end

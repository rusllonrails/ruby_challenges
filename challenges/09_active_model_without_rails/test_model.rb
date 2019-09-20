require 'securerandom'

#
# 09: ActiveModel without Rails: TestModel
#
# We use this model in related Rspec tests.
#

class TestModel < ActiveModel
  ATTRS = %w(
    first_name
    last_name
    age
  )

  attr_accessible *ATTRS

  attr_reader :updated_at, :code
  private :code

  validates :first_name, :last_name, :age, presence: true
  validates :age, numericality: true

  before_validation :strip_attributes!
  before_save :set_timestamp!, :generate_transaction_code!

  private

  def strip_attributes!
    ATTRS.map do |attr|
      val = send(attr)
      send("#{attr}=", val.strip) if val && val.is_a?(String)
    end
  end

  def set_timestamp!
    @updated_at = Time.now
  end

  def generate_transaction_code!
    @code = SecureRandom.urlsafe_base64[0..5]
  end
end

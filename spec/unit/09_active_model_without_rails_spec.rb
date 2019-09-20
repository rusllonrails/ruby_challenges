require 'spec_helper'
require './challenges/09_active_model_without_rails'
require './challenges/09_active_model_without_rails/test_model'

describe '09: ActiveModel without rails' do
  let(:nick) do
    TestModel.new
  end

  describe 'AttrAccessible' do
    it 'allows to set and get virtual attributes' do
      nick.first_name = 'Brandon'
      nick.age = 18

      expect(nick.first_name).to be_eql('Brandon')
      expect(nick.age).to be(18)

      nick.age = 20

      expect(nick.age).to be(20)
    end
  end

  describe 'Validations' do
    it 'it allows to check if instance is not valid' do
      expect(nick.valid?).to be_falsey

      nick.first_name = 'Nick'
      expect(nick.valid?).to be_falsey
    end

    it 'it allows to see errors if instance is not valid' do
      nick.first_name = 'Nick'
      nick.valid?

      expect(nick.errors).to match(
        {
          last_name: ["can't be blank!"],
          age: ["can't be blank!"]
        }
      )

      nick.age = "not number"
      nick.valid?

      expect(nick.errors).to match(
        {
          last_name: ["can't be blank!"],
          age: ['should be number!']
        }
      )
    end

    it 'it allows to check if instance is valid' do
      nick.first_name = 'Nick'
      nick.last_name = 'Brandon'
      nick.age = 18

      expect(nick.valid?).to be_truthy
    end
  end

  describe 'Callbacks' do
    let(:prefilled_nick) do
      rec = TestModel.new

      rec.first_name = 'Nick'
      rec.last_name = 'Brandon'
      rec.age = 'not number'

      rec
    end

    it 'if allows to have callbacks before validation process' do
      prefilled_nick.first_name = " name with whitespaces "
      prefilled_nick.valid?

      expect(prefilled_nick.first_name).to be_eql("name with whitespaces")
    end

    it 'if allows to have callbacks before save process' do
      prefilled_nick.save

      expect(prefilled_nick.updated_at).not_to be_nil
    end
  end
end

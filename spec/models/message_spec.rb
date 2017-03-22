require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with full exist" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without body" do
      message = build(:message, body: nil)
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end
  end
end

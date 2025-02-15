# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  monthly    :boolean
#  budget     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'

describe Category do
  fixtures :categories
  fixtures :users

  before do
    category = categories(:category_01)
    category.save
    @category = Category.first
  end

  # Relations
  context 'Relations' do
    it 'has many records.' do
      expect(@category.records).to be_truthy
    end

    it 'belongs to user' do
      expect(@category.user).to be_truthy
    end
  end

  # Validations
  describe 'Validations' do
    context 'normal case' do
      it "can save" do
        expect(@category).to be_valid
      end

      it "can save normal name value" do
        values = ["食費", "eating", "10000"]
        values.each do |value|
          @category.name = value
          expect(@category).to be_valid
        end
      end

      it "can save normal monthly value" do
        values = [true, false]
        values.each do |value|
          @category.monthly = value
          expect(@category).to be_valid
        end
      end

      it "can save normal budget value" do
        values = [0, 1, 10000, 100000000]
        values.each do |value|
          @category.budget = value
          expect(@category).to be_valid
        end
      end

      it 'can save normal user_id value.' do
        values = [1, 10, 100, 1000]
        values.each do |value|
          @category.user_id = value
          expect(@category).to be_valid
        end
      end
    end

    context "error case" do
      it "can not save invalid name value" do
        values = [nil, ""]
        values.each do |value|
          @category.name = value
          expect(@category).not_to be_valid
        end
      end

      it "can not save invalid monthly value" do
        values = [nil, ""]
        values.each do |value|
          @category.monthly = value
          expect(@category).not_to be_valid
        end
      end

      it "can not save invalid budget value" do
        values = [nil, true, "string", "", 1.08, -1]
        values.each do |value|
          @category.budget = value
          expect(@category).not_to be_valid
        end
      end
    end
  end

  # Scopes
  context 'Scopes' do
  end

  # Methods
  context 'Methods' do
  end
end

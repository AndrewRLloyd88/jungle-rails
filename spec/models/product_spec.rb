require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save if all fields are valid' do
      @category = Category.new
      @product = Product.new(name: "cool item", price: 50000, quantity: 3, category: @category)

      @product.save

      expect(@product.id).to be_present
      expect(@product).to be_valid
    end

    it 'should fail to save without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price: 50000, quantity: 3, category: @category)

      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should fail to save without a price' do
      @category = Category.new
      @product = Product.new(name: "cool item", price: nil, quantity: 3, category: @category)

      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should fail to save without a quantity' do
      @category = Category.new
      @product = Product.new(name: "cool item", price: 50000, quantity: nil, category: @category)

      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should fail to save without a category' do
      @product = Product.new(name: "cool item", price: 50000, quantity: 3, category: nil)

      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
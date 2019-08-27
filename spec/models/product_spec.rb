require 'rails_helper'

RSpec.describe Product, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    it 'is valid with all 4 fields present' do
      @category = Category.new(id: 1, name: "Apparel")
      @product = Product.new
      @product.name = 'Anything'
      @product.price = 36.00
      @product.quantity = 15
      @product.category = @category
      expect(@product).to be_valid
    end
    
    it 'is not valid if name is not present' do
      @category = Category.new(id: 1, name: "Apparel")
      @product = Product.new
      @product.price = 37.00
      @product.quantity = 10
      @product.category = @category
      expect(@product).to_not be_valid
    end
    
    it 'is not valid if price is not present' do
      @category = Category.new(id: 1, name: "Apparel")
      @product = Product.new
      @product.name = "Shirt"
      @product.quantity = 10
      @product.category = @category
      expect(@product).to_not be_valid
    end
    
    it 'is not valid if quantity is not present' do
      @category = Category.new(id: 1, name: "Apparel")
      @product = Product.new
      @product.name = "Shirt"
      @product.price = 99.99
      @product.category = @category
      expect(@product).to_not be_valid
    end
    
    it 'is not valid if category is not present' do
      @category = Category.new(id: 1, name: "Apparel")
      @product = Product.new
      @product.name = "Shirt"
      @product.price = 99.99
      @product.quantity = 99
      # @product.category = @category
      expect(@product).to_not be_valid
    end
  end
end

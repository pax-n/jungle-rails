require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context 'saves' do
      before do
        @category = Category.create(name: 'Games')
        @product = Product.create(
          name: 'Super Smash Bros',
          price: 80,
          category: @category,
          quantity: 10
        )
      end
      it('should give an error') do
        expect(@product.errors.full_messages).to be_empty
      end
    end

    context 'name' do
      before do
        @category = Category.create(name: 'Games')
        @product = Product.create(
          price: 60,
          category: @category,
          quantity: 10
        )
      end
      it('should give an error') do
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'price' do
      before do
        @category = Category.create(name: 'Games')
        @product = Product.create(
          name: 'Super Smash Bros',
          category: @category,
          quantity: 10
        )
      end
      it('should give an error') do
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'quantity' do
      before do
        @category = Category.create(name: 'Games')
        @product = Product.create(
          name: 'Super Smash Bros',
          price: 20000,
          category: @category,
        )
      end
      it('should give an error') do
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'category' do
      before do
        @product = Product.create(
          name: 'Super Smash Bros',
          price: 60,
          category: @category,
          quantity: 10
        )
      end
      it('should give an error') do
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end
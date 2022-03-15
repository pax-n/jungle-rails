require 'rails_helper'

RSpec.feature "Visitor navigates to home page and adds to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add item to cart" do
    visit root_path
    find('form.button_to').click

    # DEBUG / VERIFY
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end

end
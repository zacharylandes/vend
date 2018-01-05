require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the snacks belonging to that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create!(name:"cookie", price: 2)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("cookie")
    expect(page).to have_content(2)

  end
  it 'they see the average price of snacks belonging to that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create!(name:"cookie", price: 2)
    snack1 = dons.snacks.create!(name:"cookie", price: 6)

    visit machine_path(dons)

    expect(page).to have_content(4)
  end
end

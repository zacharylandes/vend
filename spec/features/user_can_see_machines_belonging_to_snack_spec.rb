require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see the machines belonging to that snack' do
    dons  = Owner.create(name: "Don's ")
    sams  = Owner.create(name: "sams")
    jacks  = Owner.create(name: "jacks")
    snack = Snack.create!(name:"cookie", price: 2)
    machine1 = snack.machines.create(location: 'dons', owner_id: 1)
    machine2 = snack.machines.create(location: 'sams', owner_id: 2)
    machine3 = snack.machines.create(location: 'jacks', owner_id: 3)
    
    visit snack_path(snack)

    expect(page).to have_content("cookie")
    expect(page).to have_content(2)
    save_and_open_page
    expect(page).to have_content("dons")
    save_and_open_page
    expect(page).to have_content("sams")
    expect(page).to have_content("jacks")

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

require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see the machines belonging to that snack' do
    dons  = Owner.create(name: "Don's ")
    sams  = Owner.create(name: "sams")
    jacks  = Owner.create(name: "jacks")
    snack = Snack.create!(name:"cookie", price: 2)
    machine1 = snack.machines.create!(location: 'dons', owner_id: dons.id)
    machine2 = snack.machines.create(location: 'sams', owner_id: sams.id)
    machine3 = snack.machines.create(location: 'jacks', owner_id: jacks.id)
    visit snack_path(snack)

    expect(page).to have_content("cookie")
    expect(page).to have_content(2)
    expect(page).to have_content("dons")
    expect(page).to have_content("sams")
    expect(page).to have_content("jacks")

  end
  it 'they see the average price of snacks belonging to that machine' do
    dons  = Owner.create(name: "Don's ")
    sams  = Owner.create(name: "sams")
    jacks  = Owner.create(name: "jacks")
    snack1 = Snack.create!(name:"cookie", price: 2)

    machine1 = snack1.machines.create!(location: 'dons', owner_id: dons.id)
    machine2 = snack1.machines.create(location: 'sams', owner_id: sams.id)
    machine3 = snack1.machines.create(location: 'jacks', owner_id: jacks.id)
    snack = machine1.snacks.create!(name:"bar", price: 3)
    snack2 = machine1.snacks.create!(name:"bar", price: 3)

    visit snack_path(snack1)
    save_and_open_page

    expect(page).to have_content("snack count: 3")
  end
end

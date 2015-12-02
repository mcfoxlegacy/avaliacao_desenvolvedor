require "rails_helper"
feature "User register order" do
  scenario "successfully" do
    visit new_order_path
    fill_in "Comprador:", with: "João"
    fill_in "Descrição:", with: "R$10 off R$20 of food"
    fill_in "Preço Unitário:", with: 10.0
    fill_in "Quantidade:", with: 2
    fill_in "Endereço:", with: "987 Fake St"
    fill_in "Fornecedor:", with: "Bob's Pizza"

    click_on "Cadastrar"

    expect(page).to have_content "João"
    expect(page).to have_content "R$10 off R$20 of food"
    expect(page).to have_content 10.0
    expect(page).to have_content 2
    expect(page).to have_content "987 Fake St"
    expect(page).to have_content "Bob's Pizza"
  end
end

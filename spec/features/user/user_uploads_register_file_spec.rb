require 'rails_helper'

feature 'User uploads a register file' do
  scenario 'successfuly sees' do
    visit root_path

    attach_file 'register_file', 'spec/support/dados.txt'

    click_on 'Save'

    register_list = page.all('.table tr')
    expect(register_list.count).to eq 4

    [
      'João Silva R$10 off R$20 of food 10.0 2 987 Fake St Bob\'s Pizza',
      'Amy Pond R$30 of awesome for R$10 10.0 5 456 Unreal Rd Tom\'s Awesome Shop',
      'Marty McFly R$20 Sneakers for R$5 5.0 1 123 Fake St Sneaker Store Emporium',
      'Snake Plissken R$20 Sneakers for R$5 5.0 4 123 Fake St Sneaker Store Emporium'
    ].each_with_index do |register, index|
      expect(register_list[index]).to have_content register
    end
  end
end

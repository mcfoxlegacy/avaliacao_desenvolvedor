require 'rails_helper'

describe Parser do
  it 'should parse the content to a hash' do
    parser = Parser.new(File.open('spec/support/parser_test.txt').read)
    expect(parser.registers)
      .to eq [{ buyer: 'João Silva',
                description: 'R$10 off R$20 of food',
                unity_price: 10.0,
                quantity: 2,
                address: '987 Fake St',
                supplier: 'Bob\'s Pizza'
               }]
  end
end

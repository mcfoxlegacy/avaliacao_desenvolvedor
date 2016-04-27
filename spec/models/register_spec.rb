require 'rails_helper'

describe Register, '.save_registers' do
  it 'should save successfuly, all records from a given array' do
    # setup
    parser = Parser.new(File.open('spec/support/dados.txt').read)

    # exercise
    result = Register.save_registers(parser.registers)

    # verify
    expect(result).to eq true

    # teardown is handled for you by RSpec
  end
end

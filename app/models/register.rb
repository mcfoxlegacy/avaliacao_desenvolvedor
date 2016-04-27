class Register < ActiveRecord::Base
  def self.save_registers(registers)
    registers.each do |register|
      create(register)
    end
    true
  end
end

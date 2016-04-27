class RegistersController < ApplicationController
  def new
  end

  def create
    content = params[:register_file].read
    if content.empty?
      flash[:notice] = 'Empty file. Please upload a valid one.'
      render :new
    else
      parser = Parser.new(content)
      Register.save_registers(parser.registers)
      redirect_to action: :index
    end
  end

  def index
    @registers = Register.all
  end
end

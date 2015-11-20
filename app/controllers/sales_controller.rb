# -*- encoding : utf-8 -*-
class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.paginate(page: params[:page], per_page: 10)
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    accepted_formats = ['.txt']
    @success = true
    file = params[:sale][:upload_file]
    if accepted_formats.include? File.extname(file.original_filename)
      begin
        Sale.import_file(file.read)
        @message = I18n.t('file.success')
      rescue
        @success = false
        @message = I18n.t('file.error')
      end
    else
      @success = false
      @message = I18n.t('file.invalid_format')
    end
    respond_to do |format|
      if @success
        format.html { redirect_to sales_url, notice: @message }
      else
        flash[:error] = @message
        format.html { redirect_to sales_url }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sale_params
    params.require(:sale).permit(:upload_file)
  end
end

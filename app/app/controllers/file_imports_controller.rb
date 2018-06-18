class FileImportsController < ApplicationController
  def index
    @file_imports = FileImport.all
  end
  def show
    @file_import = FileImport.find(params[:id])
    @data_imported = @file_import.sales
  end
  def create
    @imported_file = FileImport.new
    @imported_file.filename = file_import_params[:file].original_filename
    @imported_file.content = File.read(file_import_params[:file].tempfile)
    if @imported_file.save
      @imported_file.content.each_line do |record|
        @imported_sale = Sale.new
        data = record.chomp.split("\t")
        @imported_sale.client = data[0]
        @imported_sale.description = data[1]
        @imported_sale.unit_price = data[2]
        @imported_sale.quantity = data[3]
        @imported_sale.address = data[4]
        @imported_sale.supplier = data[5]
        @imported_sale.file_import = @imported_file
        @imported_sale.save
      end
    redirect_to @imported_file
    else
      redirect_to file_imports_url
    end
  end
  def destroy
    @imported_file = FileImport.find(params[:id])
    @imported_file.destroy
    redirect_to file_imports_url
  end
  def file_import_params
    params.require(:file_import).permit(:file)
  end
end

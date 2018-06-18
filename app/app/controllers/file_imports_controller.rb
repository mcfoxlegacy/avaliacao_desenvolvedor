class FileImportsController < ApplicationController
  def index
    @file_import = FileImport.new
    @file_imports = FileImport.all
  end
 
  def show
    @file_import = FileImport.find(params[:id])
    @data_imported = @file_import.sales
  end
  
  def create
    @file_import = FileImport.new
    if file_import_params[:file].present?
      @file_import.filename = file_import_params[:file].original_filename
      @file_import.content = File.read(file_import_params[:file].tempfile)
      first_line = true
      
      if @file_import.save
        @file_import.content.each_line do |record|
          if first_line
            first_line = false
          else
            data = record.chomp.split("\t")
            Sale.create(
              client: data[0],
              description: data[1],
              unit_price: data[2],
              quantity: data[3],
              address: data[4],
              supplier: data[5],
              file_import: @file_import
            )
          end
        end
      redirect_to @file_import
      else
        render :index
      end
    else
      render :index, status: :unprocessable_entity 
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

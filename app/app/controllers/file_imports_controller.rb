class FileImportsController < ApplicationController
  def index
    @file_imports = FileImport.all
  end
  def show
    @file_import = FileImport.find(params[:id])
  end
  def create
    @imported_file = FileImport.new
    @imported_file.filename = file_import_params[:file].original_filename
    @imported_file.content = File.read(file_import_params[:file].tempfile)
    if @imported_file.save
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

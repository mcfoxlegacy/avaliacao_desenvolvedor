require 'rails_helper'

RSpec.describe FileImportsController, type: :controller do
  describe 'GET #index' do
    context 'when valid' do
      let!(:files) do
        3.times do |index|
          FileImport.create!(filename: "file_#{index}.txt", content: 'lorem ipsum dolor')
        end
      end
      
      before do
        get :index
      end
      
      it { expect(response).to have_http_status(:ok) }
      it { expect(assigns(:file_imports).count).to eq(3) }
    end
  end
  
  describe 'GET #show' do
    context 'when valid' do
      let!(:file_import) do
        FileImport.create!(filename: "myfile.txt", content: 'lorem ipsum dolor')
      end 
      
      before do
        get :show, params: {id: file_import}
      end
      
      it { expect(response).to have_http_status(:ok) }
      it { expect(assigns(:file_import)).to eq(file_import) }
    end
  end
  
  describe 'POST #create' do
    context 'when valid' do
      let!(:import_attributes) do
        { file: Rack::Test::UploadedFile.new(File.join(Rails.root, 'dados.txt')) }
      end 
      
      before do
        post :create, params: {file_import: import_attributes}
      end
      
      it { expect(response).to have_http_status(:redirect) }
      it { expect(FileImport.count).to eq(1) }
      it { expect(response).to redirect_to file_import_path(assigns(:file_import)) }
    end
    
    context 'when invalid' do
      let!(:import_attributes) do
        { file: nil }
      end 
      
      before do
        post :create, params: {file_import: import_attributes}
      end
      
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(FileImport.count).to eq(0) }
      it { expect(response).to render_template(:index) }
    end
  end
end
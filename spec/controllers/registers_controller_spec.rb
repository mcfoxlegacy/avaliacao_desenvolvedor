require 'rails_helper'

describe RegistersController do
  describe 'POST #create' do
    context 'when file is valid' do
      it 'renders the index page' do
        upload = ActionDispatch::Http::UploadedFile
                 .new(filename: 'dados.txt',
                      content_type: 'text/plain',
                      tempfile: File.new('spec/support/dados.txt'))

        post :create, register_file: upload

        expect(response).to redirect_to(registers_path)
      end
    end
    context 'when file is empty' do
      it 'renders the page with error' do
        upload = ActionDispatch::Http::UploadedFile
                 .new(filename: 'empty_data.txt',
                      content_type: 'text/plain',
                      tempfile: File.new('spec/support/empty_data.txt'))

        post :create, register_file: upload

        expect(response).to render_template(:new)
        expect(flash[:notice])
          .to match(/^Empty file. Please upload a valid one./)
      end
    end
  end
end

# require 'rails_helper'

# RSpec.describe SpreadsheetUploader, type: :uploader do
#   let(:spreadsheet) { create(:spreadsheet) }
#   let(:uploader) { SpreadsheetUploader.new(spreadsheet, :file) }

#   before do
#     SpreadsheetUploader.enable_processing = true
#     File.open('spec/fixtures/files/spreadsheet.xlsx') do |f|
#       uploader.store!(f)
#     end
#   end

#   after do
#     SpreadsheetUploader.enable_processing = false
#     uploader.remove!
#   end

#   context 'when uploading a spreadsheet file' do
#     it 'should store the file in the correct location' do
#       expect(uploader.store_dir).to eq("uploads/spreadsheet/file/#{spreadsheet.id}")
#     end

#     it 'should have the correct filename' do
#       expect(uploader.filename).to eq('spreadsheet.xlsx')
#     end

#     it 'should be of the correct content type' do
#       expect(uploader.content_type).to eq('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
#     end
#   end
# end

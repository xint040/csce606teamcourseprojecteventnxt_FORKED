# require 'rails_helper'

# RSpec.describe AvatarUploader, type: :uploader do
#   let(:user) { create(:user) }
#   let(:uploader) { AvatarUploader.new(user, :avatar) }

#   before do
#     AvatarUploader.enable_processing = true
#     File.open('spec/fixtures/files/avatar.png') do |f|
#       uploader.store!(f)
#     end
#   end

#   after do
#     AvatarUploader.enable_processing = false
#     uploader.remove!
#   end

#   context 'when uploading an avatar file' do
#     it 'should store the file in the correct location' do
#       expect(uploader.store_dir).to eq("uploads/user/avatar/#{user.id}")
#     end

#     it 'should have the correct filename' do
#       expect(uploader.filename).to eq('avatar.png')
#     end

#     it 'should be of the correct content type' do
#       expect(uploader.content_type).to eq('image/png')
#     end

#     it 'should allow only certain file extensions' do
#       expect(uploader.extension_allowlist).to eq(%w(jpg jpeg gif png svg))
#     end
#   end
# end

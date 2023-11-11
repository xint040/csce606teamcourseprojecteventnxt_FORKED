class Event < ApplicationRecord
    mount_uploader :event_avatar, AvatarUploader
    mount_uploader :event_box_office, SpreadsheetUploader
    has_one_attached :event_avatar 
    
    belongs_to :user 
    # <!--===================-->
    # <!--to add nested scaffold-->
    has_many :seats , dependent: :destroy
    has_many :guests , dependent: :destroy
    # <!--===================-->
end

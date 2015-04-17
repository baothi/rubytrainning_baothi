class Product < ActiveRecord::Base
	has_many :comments
	 mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
	# mount_uploaders :avatars, AvatarUploader


	# has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
 #  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
 	# validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
 	# has_attached_file :avatar,
  #                   :style => { :thumb => '120x120', :large => '300x400' },
  #                   url: '/readfiles/showfile?f=:accesskey',
  #                   path: ':rails_root/myfiles/images/:assetable_type/:assetable_id/:id_:style.:extension'
end

class ContentImage < Image
  has_attached_file :attachment, 
    :styles => {:mini => '48x48#', :large => '600x600>'},
    :default_style => :large,
    :url => "/assets/content_images/:id/:style/:basename.:extension",
    :path => Rails.env == 'production' ?
      "assets/content_images/:id/:style/:basename.:extension" :
      ":rails_root/public/assets/content_images/:id/:style/:basename.:extension",
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :bucket => ENV['S3_BUCKET']
end

class ContentFile < Asset
  has_attached_file :attachment,
    :url => "/assets/content_files/:id/:basename.:extension",
    :path => Rails.env == 'production' ? "assets/content_files/:id/:basename.:extension" :
                      ":rails_root/public/assets/content_files/:id/:basename.:extension",
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :bucket => ENV['S3_BUCKET']
end

class ContentImagesController < Spree::BaseController
  ssl_required
  def create
    @content_image = ContentImage.new(params[:content_image])
    @content_image.save!

    render :text => @content_image.attachment.url
  end

end

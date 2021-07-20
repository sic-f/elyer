class Places::Presenter
  include Rails.application.routes.url_helpers

  def initialize(place)
    @place = place
  end

  def reviewer_thumbnail(avatar)
    avatar.attached? ?
      avatar.variant(resize_to_fill: [32, 32]) :
      url_for('no_image.png')
  end

  def website_link
    site_link(:website)
  end

  def facebook_link
    site_link(:facebook)
  end

  def more_details_margin(is_signed_in)
    'pr-4' if !is_signed_in
  end

  private
    attr_reader :place

    def site_link(site)
      Places::WebsiteAndSocialMedia.generate_url(place, site)
    end
end

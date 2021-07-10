module Places
  class WebsiteAndSocialMedia
    def initialize(place, website_or_social_media_site_attr)
      @place = place
      @website_or_social_media_site_attr = website_or_social_media_site_attr
    end

    def self.generate_url(place, website_or_social_media_site_attr)
      new(place, website_or_social_media_site_attr).generate_url
    end

    def generate_url
      return '' if website_or_social_media_site_nil?

      website_or_social_media_site_has_url_scheme? ?
        website_or_social_media_site :
        append_https_to_website_or_social_media_site
    end

    private

      attr_reader :place, :website_or_social_media_site_attr

      def website_or_social_media_site_nil?
        place.public_send(website_or_social_media_site_attr).nil?
      end

      def website_or_social_media_site_has_url_scheme?
        website_or_social_media_site_uri.scheme
      end

      def website_or_social_media_site_uri
        URI.parse(place.public_send(website_or_social_media_site_attr))
      end

      def website_or_social_media_site
        place.public_send(website_or_social_media_site_attr)
      end

      def append_https_to_website_or_social_media_site
        "https://#{place.public_send(website_or_social_media_site_attr)}"
      end
  end
end

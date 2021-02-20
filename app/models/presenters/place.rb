module Presenters
  class Place
    def reviewer_thumbnail(avatar)
      avatar.attached? ?
        avatar.variant(resize_to_fill: [32, 32]) :
        url_for('no_image.png')
    end
  end
end

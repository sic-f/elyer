class Photo < Image
  has_one_attached :photo
  belongs_to :place

  delegate :user, to: :place, allow_nil: true
end

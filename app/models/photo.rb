class Photo < Image
  has_one_attached :photo
  belongs_to :place
end

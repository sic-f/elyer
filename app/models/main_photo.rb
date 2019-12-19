class MainPhoto < Image
  has_one_attached :image
  belongs_to :place
end

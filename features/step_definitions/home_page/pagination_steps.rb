Given 'six places' do
  places_attributes = [
    { name: 'Palau de Congressos de Catalunya', address: 'address' },
    { name: 'Business Planet', address: 'address' },
    { name: 'Los Almendros de Huechuraba', address: 'address' },
    { name: 'Can Domenge. Centre Tecnologic', address: 'address' },
    { name: 'Feria de Muestras de Navarra, S.L.', address: 'address' },
    {
      name: 'Centro de Exposiciones y Convenciones de Chihuahua',
      address: 'address'
    },
  ]

  places_attributes.each do |place_attributes|
    create :place, place_attributes
  end
end

When 'user clicks on page {int}' do |page_number|
  click_link page_number
end

Then 'user sees {string}' do |place_name|
  assert_text place_name
end

Then 'user should not see {string}' do |place_name|
  assert_no_text place_name
end

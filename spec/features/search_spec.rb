require 'spec_helper.rb'

feature "Looking up properties", js: true do
  before do
    Property.create!(name: 'Beautiful Villa', 
    description: 'A beautiful villa by the sea',
    address: 'Beach Ave. 75',
    property_type: 'Vacation',
    floor: 0)
    Property.create!(name: 'Great Apartment', 
    description: 'A beautiful apartment in the city',
    address: 'City Str. 75',
    property_type: 'City',
    floor: 5)
    Property.create!(name: 'Affordable Apartment', 
    description: 'An affordable apartment in the city',
    address: 'City Str. 80',
    property_type: 'City',
    floor: 4)
  end
  scenario "finding properties" do
    visit '/'
    fill_in "keywords", with: "Apartment"
    click_on "Search"

    expect(page).to have_content("Affordable Apartment")
    expect(page).to have_content("Great Apartment")
  end
end
require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they delete an artist and gets sent to all artists" do
    artist1_name = "Bob Marley"
    artist2_name = "Gustav Mahler"
    image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist1 = Artist.create(name: artist1_name, image_path: image_path)
    artist2 = Artist.create(name: artist2_name, image_path: image_path)

    visit artist_path(artist1)

    click_on "Delete"

    expect(page).to have_content artist2.name
    expect(page).not_to have_content artist1.name
  end
end

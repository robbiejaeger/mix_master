require 'rails_helper'

RSpec.feature "User edits and existing artist" do
  scenario "they see an artist page with edited name" do
    artist_name = "Gustav Mahler"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)

    click_on "Edit"
    fill_in "artist_name", with: "Sibelius"
    click_on "Update Artist"

    expect(page).to have_content "Sibelius"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end

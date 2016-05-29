require 'rails_helper'

RSpec.feature "User edits an existing playlist" do
  scenario "they see the updated data for the individual playlist" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = Playlist.create(name: "My Jams")
    playlist.songs = [song_one, song_two]

    visit playlist_path(playlist)
    click_on "Edit"
    uncheck("song-#{song_two.id}")
    check("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content playlist.name
    expect(page).to_not have_content song_two.title
    expect(page).to have_content song_three.title
  end
end

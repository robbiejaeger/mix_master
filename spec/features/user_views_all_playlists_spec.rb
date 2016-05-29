require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see the names of each playlist" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist1 = Playlist.create(name: "My Jams")
    playlist2 = Playlist.create(name: "Dana Jams")
    playlist1.songs = [song_one]
    playlist2.songs = [song_two, song_three]
    playlists = [playlist1, playlist2]

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end

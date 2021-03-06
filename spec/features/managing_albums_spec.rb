require 'rails_helper'

def create_astrolounge
  Album.create!(
    title: 'Astrolounge',
    artist: 'Smash Mouth',
    year: '1999'
  )
end

feature "Manage Albums" do
  scenario "List no Albums" do
    visit albums_path

    expect(page.find('h1')).to have_content(/Albums/)
    expect(page).to have_content(/No albums available/i)
  end

  scenario "List all Albums" do
    create_astrolounge

    visit albums_path

    expect(page.find('.album')).to have_content(/Astrolounge/)
    expect(page.find('.artist')).to have_content(/Smash Mouth/)
    expect(page.find('.year')).to have_content(/1999/)
    expect(page).not_to have_content(/No albums available/i)
  end

  scenario "Add new Album" do
    visit new_album_path
    fill_in 'Title', with: 'Astrolounge'
    fill_in 'Artist', with: 'Smash Mouth'
    fill_in 'Year', with: '1999'
    click_on 'Create Album'

    expect(current_path).to eq(album_path(Album.last.id))
    expect(find('.notice')).to have_content(/success/i)
  end

  scenario "Update an Album" do
    album = create_astrolounge

    visit edit_album_path(album)
    fill_in 'Title', with: 'Smash Mouth'
    fill_in 'Year', with: '2001'
    click_on 'Update Album'

    expect(current_path).to eq(album_path(album))
    expect(find('.notice')).to have_content(/updated/i)
  end

  scenario "Show an Album" do
    album = create_astrolounge

    visit album_path(album)

    expect(current_path).to eq(album_path(album))
  end

  scenario "Remove an Album" do
    create_astrolounge
    
    visit albums_path
    click_on 'Remove'

    expect(current_path).to eq(albums_path)
    expect(find('.notice')).to have_content(/deleted/i)
  end
end

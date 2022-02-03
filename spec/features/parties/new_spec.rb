require 'rails_helper'

RSpec.describe 'Party New Page' do
  describe 'view' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com")
    end

    it 'includes all information about the viewing party' do
      top_movie = MovieService.top_movies.first

      visit "/users/#{@user_1.id}/movies/#{top_movie.id}/viewing-party/new"

      fill_in :duration, with: '180'
      fill_in :day, with: '02/03/21'
      fill_in :start_time, with: '7:00'

      click_button 'Submit'
      expect(current_path).to eq("/users/#{@user_1.id}")


      expect(page).to have_content(top_movie.title)
      expect(page).to have_content("Start Time: 2000-01-01 07:00:00")
      # Movie Title
      # Vote Average of the movie
      # Runtime in hours & minutes
      # Genre(s) associated to movie
      # Summary description
      # List the first 10 cast members (characters&actress/actors)
      # Count of total reviews
      # Each review's author and information
    end
  end
end
require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 787, play_count: 5445)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 111, play_count: 4111)
        @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 4111)
      end
      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(299.67)
      end
    end
  end
end

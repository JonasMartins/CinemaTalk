class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :genre
    end
  end
end
=begin
    genre: action, default: false
    genre: adventure, default: false
    genre: comedy, default: false
    genre: crime, default: false
    genre: drama, default: false
    genre: fantasy, default: false
    genre: historical, default: false
    genre: historical_fiction, default: false
    genre: horror, default: false
    genre: mystery, default: false
    genre: philosophical, default: false
    genre: political, default: false
    genre: romance, default: false
    genre: saga, default: false
    genre: satira, default: false
    genre: science_fiction, default: false
    genre: thriller, default: false
    genre: urban, default: false
    genre: western, default: false
    genre: animation, default: false

=end
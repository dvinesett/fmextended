class AddDetailsToScrobbles < ActiveRecord::Migration
  def change
    add_column :scrobbles, :unixtime, :integer
    add_column :scrobbles, :track_mbid, :string
    add_column :scrobbles, :artist_mbid, :string
    add_column :scrobbles, :uncorrected_track_name, :string
    add_column :scrobbles, :uncorrected_track_mbid, :string
    add_column :scrobbles, :uncorrected_artist_name, :string
    add_column :scrobbles, :uncorrected_artist_mbid, :string
    add_column :scrobbles, :album_mbid, :string
    add_column :scrobbles, :album_artist_name, :string
    add_column :scrobbles, :album_artist_mbid, :string

    # update names for old columns
    change_table :scrobbles do |t|
      t.rename :trackname, :track_name
      t.rename :artistname, :artist_name
      t.rename :albumname, :album_name
    end
  end
end

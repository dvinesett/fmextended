class Scrobble < ActiveRecord::Base


  def self.import(file)
    # TODO: don't import duplicates
    CSV.foreach(file.path, { :col_sep => "\t", :headers => true }) do |row|
      hold = row.to_hash
      Scrobble.create!({
        time: hold['ISO time'],
        track_name: hold['track name'],
        artist_name: hold['artist name'],
        album_name: hold['album name'],
        application: hold['application'],
        unixtime: hold['unixtime'],
        track_mbid: hold['track mbid'],
        artist_mbid: hold['artist mid'],
        uncorrected_track_name: hold['uncorrected track name'],
        uncorrected_track_mbid: hold['uncorrected track mbid'],
        uncorrected_artist_name: hold['uncorrected artist name'],
        uncorrected_artist_mbid: hold['uncorrected artist mbid'],
        album_mbid: hold['album mbid'],
        album_artist_name: hold['album artist name'],
        album_artist_mbid: hold['album artist mbid']
      })
    end
  end
end

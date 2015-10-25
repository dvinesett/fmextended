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

    # inserts = []
    # CSV.foreach(file.path, {col_sep: "\t", headers: true}) do |row|
    #   hold = row.to_hash
    #   inserts.push "("\
    #                "#{hold['ISO time']},"\
    #                "#{hold['track name']},"\
    #                "#{hold['artist name']},"\
    #                "#{hold['album name']},"\
    #                "#{hold['application']},"\
    #                "#{hold['unixtime']},"\
    #                "#{hold['track mbid']},"\
    #                "#{hold['artist mid']},"\
    #                "#{hold['uncorrected track name']},"\
    #                "#{hold['uncorrected track mbid']},"\
    #                "#{hold['uncorrected artist name']},"\
    #                "#{hold['uncorrected artist mbid']},"\
    #                "#{hold['album mbid']},"\
    #                "#{hold['album artist name']},"\
    #                "#{hold['album artist mbid']}"\
    #                ")"
    #
    # end
    # Scrobble.connection.execute 'INSERT INTO scrobbles ('\
    #                             "time,"\
    #                             "track_name,"\
    #                             "artist_name,"\
    #                             "album_name,"\
    #                             "application,"\
    #                             "unixtime,"\
    #                             "track_mbid,"\
    #                             "artist_mbid,"\
    #                             "uncorrected_track_name,"\
    #                             "uncorrected_track_mbid,"\
    #                             "uncorrected_artist_name,"\
    #                             "uncorrected_artist_mbid,"\
    #                             "album_mbid,"\
    #                             "album_artist_name,"\
    #                             "album_artist_mbid"\
    #                             ') VALUES '\
    #                             "#{inserts.join(", ")}"

  end
end

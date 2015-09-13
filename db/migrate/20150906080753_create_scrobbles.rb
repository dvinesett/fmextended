class CreateScrobbles < ActiveRecord::Migration
  def change
    create_table :scrobbles do |t|
      t.date :time
      t.string :trackname
      t.string :artistname
      t.string :albumname
      t.string :application

      t.timestamps null: false
    end
  end
end

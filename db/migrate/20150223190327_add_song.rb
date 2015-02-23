class AddSong < ActiveRecord::Migration
  def change
  	create_table :songs do |t|
  		t.string :title
  		t.string :author
  	end
  end
end

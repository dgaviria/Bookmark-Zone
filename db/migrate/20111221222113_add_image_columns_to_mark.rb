class AddImageColumnsToMark < ActiveRecord::Migration
    def self.up
      change_table :marks do |t|
        t.has_attached_file :image
      end
    end

    def self.down
      drop_attached_file :marks, :image
    end
  end
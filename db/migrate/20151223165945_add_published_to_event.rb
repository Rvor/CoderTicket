class AddPublishedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :published, :boolean
  end
end

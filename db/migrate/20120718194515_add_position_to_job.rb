class AddPositionToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :position, :integer
  end
end

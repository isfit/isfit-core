class AddPublishTimestampsToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :publish_from, :datetime
    add_column :positions, :publish_to, :datetime
  end
end

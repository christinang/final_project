class RemoveDescriptionFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_description
  end
end

class AddDefaultsToGigs3 < ActiveRecord::Migration[6.0]
  def change
    change_column :gigs, :state, :string, :default => 'applied'
  end
end

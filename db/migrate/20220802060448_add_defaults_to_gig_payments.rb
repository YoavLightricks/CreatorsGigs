class AddDefaultsToGigPayments < ActiveRecord::Migration[6.0]
  def change
    change_column :gig_payments, :state, :string, :default => 'pending'
  end
end

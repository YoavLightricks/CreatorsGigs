class CreateAuthenticatedUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :authenticated_users do |t|
      t.string :user_id
      t.string :apikey

      t.timestamps
    end
  end
end

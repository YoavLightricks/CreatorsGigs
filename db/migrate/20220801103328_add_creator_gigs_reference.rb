class AddCreatorGigsReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :gigs, :creator, index: true
    add_foreign_key :gigs, :creators
  end
end

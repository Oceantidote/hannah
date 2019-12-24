class CreateBatchMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :batch_memberships do |t|
      t.references :batch, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

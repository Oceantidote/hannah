class CreateBatchDays < ActiveRecord::Migration[5.2]
  def change
    create_table :batch_days do |t|
      t.references :batch, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end

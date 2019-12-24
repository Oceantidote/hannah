class AddEmailToBatchMemberships < ActiveRecord::Migration[5.2]
  def change
    add_column :batch_memberships, :email, :string
  end
end

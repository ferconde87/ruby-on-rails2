class AddLoginPassToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :login, :string
    add_column :people, :pass, :string
  end
end

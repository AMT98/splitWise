class AddForeignKeyToPaymentsForBills < ActiveRecord::Migration[8.0]
  def change
    # Change bill_id to NOT NULL
    change_column_null :payments, :bill_id, false

    # Add foreign key constraint and index
    add_foreign_key :payments, :bills
    add_index :payments, :bill_id
  end
end

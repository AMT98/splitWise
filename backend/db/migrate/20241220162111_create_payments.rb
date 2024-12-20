class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :payer, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.boolean :paid, default: false
      
      t.timestamps
    end
  end
end

class CreateBills < ActiveRecord::Migration[8.0]
  def change
    create_table :bills do |t|
      t.string :title, null: false
      t.decimal :amount, null: false
      t.string :currency, default: 'USD'
      t.references :payer, foreign_key: { to_table: :users }, null: false
      t.references :group, foreign_key: true, null: false

      t.timestamps
    end
  end
end

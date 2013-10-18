class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description
      t.integer :category_id
      t.float :amount
      t.boolean :is_income
      t.text :comments

      t.timestamps
    end
  end
end

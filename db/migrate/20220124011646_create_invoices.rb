class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :number
      t.string :origin
      t.string :destiny
      t.date :issued_at
      t.decimal :total_value

      t.timestamps
    end
  end
end

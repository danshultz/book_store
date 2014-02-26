class CreateOrders < ActiveRecord::Migration
  def change

    create_table :orders do |t|
      t.references :user
      t.timestamps
    end

    create_join_table :books, :orders

  end
end

class CreatePriceFilters < ActiveRecord::Migration
  def change
    create_table :spree_price_filters do |t|
      t.decimal :from
      t.decimal :to
      t.integer :position

      t.timestamps
    end
  end
end

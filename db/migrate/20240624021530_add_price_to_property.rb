# frozen_string_literal: true

class AddPriceToProperty < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :price, :integer, null: false, default: 0
  end
end

# frozen_string_literal: true

class AddPopularityToProperty < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :popularity, :integer, null: false, default: 0
  end
end

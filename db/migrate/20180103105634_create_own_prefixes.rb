class CreateOwnPrefixes < ActiveRecord::Migration[5.1]
  def change
    create_table :own_prefixes do |t|
      t.cidr :prefix
      t.timestamps
    end
  end
end

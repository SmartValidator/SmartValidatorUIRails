class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :key, index: true
      t.string :value
      t.timestamps
    end
  end
end

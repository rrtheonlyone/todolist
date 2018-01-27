class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.datetime :completed_at

      t.timestamps
    end
  end
end

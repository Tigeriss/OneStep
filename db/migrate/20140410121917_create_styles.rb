class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.string :description
      t.text :text
      t.string :media_url

      t.timestamps
    end
  end
end

class CreateConfessions < ActiveRecord::Migration
  def change
    create_table :confessions do |t|
      t.text :txt

      t.timestamps
    end
  end
end

class CreateConfessions < ActiveRecord::Migration
  def change
    change_table :confessions do |t|
      t.integer :flags
    end
  end
end

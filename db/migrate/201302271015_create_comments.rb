class CreateComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.integer :flags
    end
  end
end

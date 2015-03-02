class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.string :genre
    	t.string :title, null: false
    	t.text :content, null: false
    	t.references :user
    	t.timestamps
    end
  end
end

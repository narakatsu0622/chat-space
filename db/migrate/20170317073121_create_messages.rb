class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body, null:false
      t.text :image
      t.references :group_id, foreign_key: true
      t.references :user_id,  foreign_key: true
      t.timestamps
    end
  end
end

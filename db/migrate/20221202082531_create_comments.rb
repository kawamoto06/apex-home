class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :topic,   null: false, foreign_key: true
      t.references :topic_comment,   null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateDiaryComments < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_comments do |t|
      t.text :diary_comment, null: false
      t.references :user,    null: false, foreign_key: true
      t.references :diary,   null: false, foreign_key: true
      t.timestamps
    end
  end
end

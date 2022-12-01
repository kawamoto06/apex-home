class CreateTopicComments < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_comments do |t|
      t.text :topic_comment, null: false
      t.references :user,    null: false, foreign_key: true
      t.references :topic,   null: false, foreign_key: true
      t.timestamps
    end
  end
end

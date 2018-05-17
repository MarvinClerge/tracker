class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.string :category
      t.string :content
      t.string :contact
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end

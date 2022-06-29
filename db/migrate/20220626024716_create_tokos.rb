class CreateTokos < ActiveRecord::Migration[7.0]
  def change
    create_table :tokos do |t|
      t.string :name
      t.string :comment
      t.integer :Heart

      t.timestamps
    end
  end
end

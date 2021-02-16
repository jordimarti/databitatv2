class CreateEnts < ActiveRecord::Migration[6.1]
  def change
    create_table :ents do |t|
      t.string :name
      t.string :category
      t.string :reviewid

      t.timestamps
    end
    execute "ALTER SEQUENCE ents_id_seq START with 12068 RESTART;"
  end
end

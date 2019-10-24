class CreateDogsAndStrollsJoinTables < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs_and_strolls_join_tables do |t|
      t.references :dog, foreign_key: true
      t.references :stroll, foreign_key: true

      t.timestamps
    end
  end
end

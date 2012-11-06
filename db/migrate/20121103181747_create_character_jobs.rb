class CreateCharacterJobs < ActiveRecord::Migration
  def change
    create_table :character_jobs do |t|
      t.references :character
      t.references :job
      t.integer :level

      t.timestamps
    end
    add_index :character_jobs, :character_id
    add_index :character_jobs, :job_id
  end
end

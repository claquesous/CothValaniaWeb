class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :short_name
      t.string :remarks

      t.timestamps
    end
  end
end

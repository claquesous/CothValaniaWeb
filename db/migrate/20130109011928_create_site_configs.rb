class CreateSiteConfigs < ActiveRecord::Migration
  def change
    create_table :site_configs do |t|
      t.string :site_name
      t.string :password_digest
      t.text :description
      t.string :config_comment
      t.string :members, default: "Members"
      t.string :events, default: "Events"
      t.string :rewards, default: "Rewards"
      t.string :occurrences, default: "Occurrences"
      t.string :jobs, default: "Jobs"
      t.string :races, default: "Races"
      t.string :requirements, default: "Requirements"
      t.integer :dkp_system, default: 0

      t.timestamps
    end
  end
end

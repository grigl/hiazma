class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :job_profile
      t.text :your_profile
      t.text :requirements
      t.text :other_skillsets
      t.text :how_to_apply

      t.timestamps
    end
  end
end

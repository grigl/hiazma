class AddFieldsToJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :job_profile
    remove_column :jobs, :your_profile
    remove_column :jobs, :requirements
    remove_column :jobs, :other_skillsets
    remove_column :jobs, :how_to_apply
    add_column :jobs, :field_1, :text
    add_column :jobs, :field_2, :text
    add_column :jobs, :field_3, :text
    add_column :jobs, :field_4, :text
    add_column :jobs, :field_5, :text
    add_column :jobs, :field_6, :text
    add_column :jobs, :field_7, :text
    add_column :jobs, :field_8, :text
    add_column :jobs, :field_9, :text
    add_column :jobs, :field_10, :text
  end
end

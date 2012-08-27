class CreateJobTranslation < ActiveRecord::Migration
  def up
    Job.create_translation_table!({
      title: :string,
      job_profile: :text,
      your_profile: :text,
      requirements: :text,
      other_skillsets: :text,
      how_to_apply: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Job.drop_translation_table! migrate_data: true
  end
end

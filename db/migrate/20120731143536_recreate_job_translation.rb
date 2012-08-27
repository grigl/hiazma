class RecreateJobTranslation < ActiveRecord::Migration
  def up
    Job.drop_translation_table!
    Job.create_translation_table!({
      title: :string,
      field_1: :text,
      field_2: :text,
      field_3: :text,
      field_4: :text,
      field_5: :text,
      field_6: :text,
      field_7: :text,
      field_8: :text,
      field_9: :text,
      field_10: :text
    })
  end

  def down
    Job.drop_translation_table!
    Job.create_translation_table!({
      title: :string,
      job_profile: :text,
      your_profile: :text,
      requirements: :text,
      other_skillsets: :text,
      how_to_apply: :text
    })
  end
end

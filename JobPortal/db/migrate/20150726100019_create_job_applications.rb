class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.belongs_to    :user, index: true
      t.belongs_to    :job, index: true
      t.boolean       :approved, default: false

      t.timestamps null: false
    end
  end
end

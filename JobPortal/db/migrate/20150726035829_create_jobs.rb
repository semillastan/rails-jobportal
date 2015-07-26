class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to  :user, index: true
      t.string      :job_title
      t.string      :description
      t.integer     :minimum_salary
      t.integer     :maximum_salary
      t.boolean     :active
      
        
      t.timestamps null: false
    end
  end
end

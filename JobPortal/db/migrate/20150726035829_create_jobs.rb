class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to  :user, index: true
      t.string      :job_title
      t.string      :occupation_code
      t.string      :industry_code
      t.string      :description
      t.boolean     :active
      
        
      t.timestamps null: false
    end
  end
end

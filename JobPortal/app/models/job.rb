class Job < ActiveRecord::Base
  belongs_to :user
  has_many   :job_application
end

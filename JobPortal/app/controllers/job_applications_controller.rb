class JobApplicationsController < ApplicationController

  def apply
    job = Job.find_by(id: params[:job_id])
    @job_application = JobApplication.create(user: current_user, job: job)
    if @job_application.save
      flash[:success] = "Application successful!"
      redirect_to jobs_url
    else
      redirect_to available_jobs_url
    end
  end

  private
    def job_application_params
      params.require(:user)
      params.require(:job)
    end
end

class JobsController < ApplicationController

  def index
    @jobs = Job.where(user_id: current_user.id)
  end

  def available_jobs
    if logged_in?
      @jobs = Job.where(user_id: current_user, active: true)
    else
      puts "not logged in"
      @jobs = Job.where('active = ?', true)
    end
  end

  def new
    @job = Job.new    
  end

  def create
    @job = Job.create(job_params)
    @job.user_id = current_user.id
    if @job.save
      flash[:success] = "#{@job.job_title} created."
      redirect_to jobs_url
    else
      render 'new'
    end
  end

  private
    def job_params
      params.require(:job).permit(:job_title, :occupation_code, :industry_code, :description, :active)
    end


end

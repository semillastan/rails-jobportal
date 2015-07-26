class JobsController < ApplicationController

  def index
    @jobs = Job.where(user_id: current_user.id)
    @job_applications = JobApplication.where(user_id: current_user.id)
  end

  def available_jobs
    if logged_in?
      @jobs = Job.where(active: true)
    else
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

  def edit
    @job = Job.find(params[:id])
    if @job.user_id != current_user.id
      redirect_to jobs_url
    end
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      flash[:success] = "#{@job.job_title} updated."
      redirect_to jobs_url
    else
      render 'edit'
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "Job posting deleted."
    redirect_to jobs_url
  end

  private
    def job_params
      params.require(:job).permit(:job_title, :minimum_salary, :maximum_salary, :description, :active)
    end


end

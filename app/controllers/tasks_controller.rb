class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    render :json => @tasks
  end

  def progress
    worker = params[:worker]
    range = Date.today.beginning_of_day..Date.today.beginning_of_day+12.hour
    @am = Task.where(worker: worker).where(updated_at: range)
    if @am.present?
      den = @am.length
      count = 0
      @am.each do |am_task|
        if am_task.status
          count += 1
        end
      end
      am_pro = count / den
    else
      am_pro = 0.0
    end
    range = Date.today.beginning_of_day+12.hour..Date.today.end_of_day
    @pm = Task.where(worker: worker).where(created_at: Time.zone.today.beginning_of_day+12.hour..Time.zone.today.end_of_day)
    if @pm.present?
      den = @pm.length
      count = 0
      @pm.each do |pm_task|
        if pm_task.status
          count += 1
        end
      end
      pm_pro = count / den
    else
      pm_pro = 0.0
    end
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @whole = Task.where(worker: worker).where(created_at: range)
    if @whole.present?
      den = @whole.length
      count = 0
      @whole.each do |whole_task|
        if whole_task.status
          count += 1
        end
      end
      whole_pro = count / den
    else
      whole_pro = 0.0
    end
    
    render :json => {"am": am_pro, "pm": pm_pro, "whole": whole_pro}
  end

  def yet_task
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @todo = Task.where(worker: params[:worker]).where(status: false).where(updated_at: range)
    render :json => @todo
  end

  def add
    data = {
      "admin": params[:admin],
      "worker": params[:worker],
      "do": params[:do],
      "status": false
    }
    @todo = Task.new(data)
    if @todo.save
      result = {"status": "success", "task_id": @todo.id}
    else 
      result = {"status": "failed"}
    end
    render :json => result
  end

  def update_status
    @task = Task.find(params[:id])
    bool = params[:status]
    data = {}
    if bool == "true"
      data["status"] = true
    elsif bool == "false"
      data["status"] = false
    end
    if @task.nil?
      result = {"status": "failed task_id"}
    else 
      if @task.update(data)
        @task.touch
        result = {"status": "success", "id": @task.id}
      else 
        result = {"status": "failed update"}
      end
    end
    if @task.status
      range = Date.today.beginning_of_day..Date.today.end_of_day
      @whole = Task.where(worker: @task.worker).where(updated_at: range)
      if @whole.present?
        den = @whole.length
        count = 0
        @whole.each do |whole_task|
          if whole_task.status
            count += 1
          end
        end
        whole_pro = count / den
      else
        whole_pro = 0.0
      end
      redirect_to controller: 'users', action: 'update_progress', progress: whole_pro, name: @task.worker
    else
      render :json => result
    end
  end

end

class Admin::PlansController < ApplicationController

  before_filter :find_plan, only:[:show, :edit, :update, :destroy]

  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def create
    @plan = Plan.new(params[:plan])

    if @plan.save
      redirect_to [:admin, @plan], notice: 'Plan was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @plan.update_attributes(params[:plan])
      redirect_to [:admin, @plan], notice: 'Plan was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @plan.destroy
    redirect_to admin_plans_url
  end

  private

  def find_plan
    @plan = Plan.find(params[:id])
  end

end

class Admin::ServicesController < AdminController

  before_filter :find_service, only:[:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(params[:service])

    if @service.save
      redirect_to [:admin, @service], notice: 'Service was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @service.update_attributes(params[:service])
      redirect_to [:admin, @service], notice: 'Service was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @service.destroy
    redirect_to admin_services_url
  end

  private

  def find_service
    @service = Service.find(params[:id])
  end
end
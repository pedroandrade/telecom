require 'spec_helper'

describe Admin::ServicesController do

  let(:valid_attributes) { service_valid_attributes }

  let(:service) { create_service }

  before { controller.stub(:authenticate).and_return(true)}

  it 'assigns all services as @services' do
    get :index
    assigns(:services).should eq([service])
  end

  it 'assigns the requested service as @service' do
    get :show, { id: service.id }
    assigns(:service).should eq(service)
  end

  it 'assigns a new service as @service' do
    get :new, {}
    assigns(:service).should be_a_new(Service)
  end

  it 'assigns the requested service as @service' do
    get :edit, {id: service.id}
    assigns(:service).should eq(service)
  end

  describe 'POST create' do

    describe 'with valid params'do
      it 'creates a new Service' do
        expect {
          post :create, {service: valid_attributes}
        }.to change(Service, :count).by(1)
      end

      it 'assigns a newly created service as @service' do
        post :create, {service: valid_attributes}
        assigns(:service).should be_a(Service)
        assigns(:service).should be_persisted
      end

      it 'redirects to the created service' do
        post :create, {service: valid_attributes}
        response.should redirect_to([:admin, Service.last])
      end
    end

    describe 'with invalid params' do

      it 'assigns a newly created but unsaved service as @service' do
        post :create, { service: {} }
        assigns(:service).should be_a_new(Service)
        assigns(:service).should_not be_valid
      end

      it "re-renders the 'new' template" do
        post :create, {:service => {  }}
        response.should render_template('new')
      end

    end
  end

  describe 'PUT update' do
    describe 'with valid params' do

      it 'updates the requested service' do
        Service.any_instance.should_receive(:update_attributes).with({ 'name' => 'params1' })
        put :update, {:id => service.id, service: { 'name' => 'params1' }}
      end

      it 'assigns the requested service as @service' do
        put :update, {id: service.id, service: valid_attributes}
        assigns(:service).should eq(service)
      end

      it 'redirects to the service' do
        put :update, {id: service.id, service: valid_attributes}
        response.should redirect_to([:admin, service])
      end
    end

    describe 'with invalid params' do

      it 'assigns the service as @service' do
        put :update, {id: service.id, :service => { }}
        assigns(:service).should eq(service)
      end

      it 'validates the required attributes' do
        put :update, {id: service.id, service: { name: ''}}
        assigns(:service).should_not be_valid
      end
    end
  end

  describe 'DELETE destroy' do

    it 'destroys the requested service' do
      service = Service.create! valid_attributes
      expect {
        delete :destroy, {id: service.id}
      }.to change(Service, :count).by(-1)
    end

    it 'redirects to the services list' do
      delete :destroy, {id: service.id}
      response.should redirect_to(admin_services_url)
    end
  end

end

require 'spec_helper'

describe HomeController do
  
  let(:valid_attributes) { service_valid_attributes }

  let(:service) { create_service }
  
  it 'assigns all services as @services in homepage' do
    get :index, {}
    assigns(:services).should eq([service])
  end
  
end

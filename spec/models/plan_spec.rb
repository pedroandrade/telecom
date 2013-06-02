require 'spec_helper'

describe Plan do

  subject { create_plan }

  context 'properly filling the attributes' do

    its(:service) { should_not be_blank }
    its(:description) { should == '192 channels'}
    its(:price) { should == 199.99}
    its(:name) { should_not be_blank}
  end

  context 'validations' do

    it 'validates attributes' do
      plan = Plan.create
      plan.errors.size.should == 4
    end

    it 'validates the description attribute' do
      plan = Plan.create(name: 'Name', price: 199, service_id: create_service.id)
      validates_blank_attribute(plan, :description)
    end

    it 'validates the price attribute' do
      plan = Plan.create(name: 'Name', service_id: create_service.id, description: 'description')
      validates_blank_attribute(plan, :price)
    end

    it 'validates the name attribute' do
      plan = Plan.create(price: 1.8, service_id: create_service.id, description: 'description')
      validates_blank_attribute(plan, :name)
    end

    it 'validates the service_id attribute' do
      plan = Plan.create(price: 1.8, description: 'description', name: 'name')
      validates_blank_attribute(plan, :service_id)
    end
  end

end
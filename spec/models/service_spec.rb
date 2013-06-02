require 'spec_helper'

describe Service do

  subject { create_service }

  context 'properly filling the attributes' do
    its(:name) { should_not be_blank}
  end

  context 'validations' do

    it 'validates attributes' do
      service = Service.create
      service.errors.size.should == 1
    end

    it 'validates name attribute' do
      service = Service.create(name: '')
      validates_blank_attribute(service, :name)
    end

    it 'validates uniqueness service name' do
      service = Service.create(name: 'Pedro')
      service.should be_valid
      service_duplicated = Service.create(name: 'Pedro')
      service_duplicated.should_not be_valid
    end

  end

end
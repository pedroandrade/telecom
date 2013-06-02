module ModelRecordsHelper

	def create_plan
		Plan.create! plan_valid_attributes
	end

	def create_service
		Service.create! service_valid_attributes
	end

	def service_valid_attributes
		{ name: "service-#{sequence}" }
	end

	def plan_valid_attributes
		{
      name: "plan-#{sequence}",
      description: '192 channels',
      price: 199.99,
      service_id: create_service.id
    }
	end

	def validates_blank_attribute(record, attribute)
		record.errors.size.should == 1
		record.errors[attribute].first.should == "can't be blank"
	end

	def sequence
		chars = (("a".."z").to_a + ("1".."9").to_a )- %w(i o 0 1 l 0)
    newpass = Array.new(20, '').collect{chars[rand(chars.size)]}.join
	end

	RSpec.configuration.include ModelRecordsHelper
end
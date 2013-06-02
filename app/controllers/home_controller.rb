class HomeController < ApplicationController

	layout 'home'

	def index
    @services = Service.all
	end
end

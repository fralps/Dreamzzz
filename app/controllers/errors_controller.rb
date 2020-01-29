class ErrorsController < ApplicationController

	# 404 not found error page
	def not_found
		render status: 404
	end

	# 500 server errors page
	def server_error
		render status: 500
	end
end

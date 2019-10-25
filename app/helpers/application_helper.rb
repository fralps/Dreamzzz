# frozen_string_literal: true

module ApplicationHelper
  # Flash messages
  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info alert-dismissible fade show '
    when 'success' then 'alert alert-success alert-dismissible fade show'
    when 'error' then 'alert alert-danger alert-dismissible fade show'
    when 'alert' then 'alert alert-warning alert-dismissible fade show'
    end
  end

  # For modals layout --> make resource accesible everywhere in the app
  def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
end

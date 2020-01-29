# frozen_string_literal: true

class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:statistics]

  def home; end

  # Chart page
  def statistics  	
  end
end

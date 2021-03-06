class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit
  include Pagy::Backend
end

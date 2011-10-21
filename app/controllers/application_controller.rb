# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery :secret => '760223299f1b8939d906c357458c0144ba24c87c6606f841a17991e26777f1c9229d4e7e9d706dd84295258a8e4f1dfd21422a8045a2b26572a3692445b3fb6f'
  ## See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end

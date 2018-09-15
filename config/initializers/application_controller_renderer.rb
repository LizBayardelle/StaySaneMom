# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

require "before_filter_patch"

ActiveSupport::Reloader.to_prepare do
  ActionController::Base.send(:include, BeforeFilterPatch)
end

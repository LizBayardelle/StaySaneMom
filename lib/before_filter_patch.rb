module BeforeFilterPatch
  extend ActiveSupport::Concern

  included do
    class << self
      alias_method :before_filter, :before_action
    end
  end
end

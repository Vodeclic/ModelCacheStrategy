# require 'model_cache_strategy/workers/sns_publication_worker'

module ModelCacheStrategy
  module Callbacks
    module CacheManagement
      extend ActiveSupport::Concern

      module ClassMethods
        def resource_hook(resource)
          class_eval do
            class_attribute :cached_resource_name

            self.send('cached_resource_name=', resource)

            after_create  -> { resource_hook(:create) }, :unless => :skip_http_callbacks
            after_update  -> { resource_hook(:update) }, :unless => :skip_http_callbacks
            after_destroy -> { resource_hook(:delete) }, :unless => :skip_http_callbacks

            define_method :resource_hook do |callback_type|
              ModelCacheStrategy.for(cached_resource_name).new(self, callback_type: callback_type).expire!
            end
          end
        end
      end

    end
  end
end
require 'sidekiq'

module ModelCacheStrategy
  module Workers
    class VarnishCacheExpirationsWorker
      include Sidekiq::Worker

      def perform(expiration_regex, callback_type = nil)
        adapter = ModelCacheStrategy::Adapters::Varnish.new
        adapter.call_varnish(expiration_regex, callback_type: callback_type)
      end
    end

  end
end
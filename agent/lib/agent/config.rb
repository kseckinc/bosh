module Bosh::Agent
  class Config
    class << self
      attr_accessor :base_dir, :logger, :redis_options, :pubsub_redis
      attr_accessor :blobstore, :agent_id, :configure, :blobstore_options
      attr_accessor :settings

      def setup(config)
        @base_dir = config["base_dir"]
        @logger = Logger.new(STDOUT)
        @logger.level = Logger.const_get(config["logging"]["level"].upcase)
        @agent_id = config["agent_id"]

        @configure = config["configure"]
        @redis_options = {:host => config["redis"]["host"],
                           :port => config["redis"]["port"],
                           :password => config["redis"]["password"],
                           :logger => @logger, :timeout => 0,
                           :thread_safe => true}

        # TODO: right now this will only appy the the simple blobstore type
        @blobstore_options = config["blobstore"]
        @settings = {}
      end


    end
  end
end

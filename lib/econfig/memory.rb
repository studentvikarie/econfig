module Econfig
  class Memory
    def initialize
      @mutex = Mutex.new
      @options = {}
    end

    def keys
      Set.new(@options.keys)
    end

    def has_key?(key)
      @options.has_key?(key)
    end

    def get(key)
      @options[key]
    end

    def set(key, value)
      @mutex.synchronize do
        @options[key] = value
      end
    end

    def clear
      @mutex.synchronize do
        @options.clear
      end
    end
  end
end

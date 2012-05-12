module Ramcrest
  class Match
    attr_reader :description

    def self.success
      Match.new(true, nil)
    end

    def self.mismatch(description) 
      Match.new(false, description)
    end

    def matched?
      @matched
    end

    private
    
    def initialize(matched, description)
      @matched = matched
      @description = description
    end
  end
end

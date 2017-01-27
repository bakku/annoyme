require 'annoyme/version'
require 'annoyme/cli'

module Annoyme
  def self.execute
    CLI.start(ARGV)
  end
end

require 'annoyme/version'
require 'annoyme/cli'

module Annoyme
  CONFIG_FILE = "#{ENV['HOME']}/.annoyme"

  def self.execute
    CLI.start(ARGV)
  end
end

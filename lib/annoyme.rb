require 'annoyme/version'
require 'annoyme/cli'

module Annoyme
  DEFAULT_NOTES_FILE = "#{ENV['HOME']}/.annoyme"

  def self.execute
    CLI.start(ARGV)
  end
end

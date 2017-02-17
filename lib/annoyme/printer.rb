require_relative 'logger'

module Annoyme
  class Printer
    def initialize(file)
      @file = file
    end

    def print
      notes = @file.parse

      return if notes.empty?

      puts ""
      Logger.colored("TODO\n", :cyan)
      Logger.print_array_colorful(notes, with_index: true)
      puts ""
    end
  end
end

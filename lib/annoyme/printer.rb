require_relative 'config_file'
require_relative 'logger'

module Annoyme

  class Printer

    def self.print
      notes = ConfigFile.parse

      return if notes.empty?
      
      puts ""
      Logger.colored("TODO\n", :cyan)
      Logger.print_array_colorful(notes, with_index: true)
      puts ""
    end

  end

end

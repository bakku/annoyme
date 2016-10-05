require_relative 'config_file'
require_relative 'logger'

module Annoyme

  class Printer

    def self.print
      notes = ConfigFile.parse
      Logger.print_array_colorful(notes, with_index: true)
    end

  end

end

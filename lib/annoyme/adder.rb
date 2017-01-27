require_relative 'notes_file'
require_relative 'logger'

module Annoyme
  class Adder
    def self.add(note)
      notes = ConfigFile.parse
      notes << note
      ConfigFile.write(notes)
      Logger.green('added', note)
    end
  end
end

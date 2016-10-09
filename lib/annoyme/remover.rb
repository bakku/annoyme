require_relative 'config_file'
require_relative 'logger'

module Annoyme

  class Remover

    def self.remove(note)
      notes = ConfigFile.parse

      if is_number?(note)
        note = notes.delete_at(note.to_i)
        ConfigFile.write(notes)
        Logger.red('deleted', "#{note}")
      else
        Logger.red('error', 'You did not specify a note using a number')
      end
    end

    private

    def self.is_number?(string)
      if Float(string)
        true
      end
    rescue
      false
    end

  end

end

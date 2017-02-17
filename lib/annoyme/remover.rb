require_relative 'logger'

module Annoyme
  class Remover
    def initialize(file)
      @file = file
    end

    def remove(note)
      notes = @file.parse

      if is_number?(note)
        note = notes.delete_at((note.to_i - 1))

        if note.nil?
          Logger.red('error', 'Seems like your specified number was out of index')
          return
        end

        @file.write(notes)
        Logger.red('deleted', "#{note}")
      else
        Logger.red('error', 'You did not specify a note using a number')
      end
    end

    private

    def is_number?(string)
      if Float(string)
        true
      end
    rescue
      false
    end
  end
end

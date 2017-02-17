require_relative 'logger'

module Annoyme
  class Adder
    def initialize(file)
      @file = file
    end

    def add(note)
      notes = @file.parse
      notes << note
      @file.write(notes)
      Logger.green('added', note)
    end
  end
end

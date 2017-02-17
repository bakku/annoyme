require 'thor'

require_relative 'notes_file'
require_relative 'initializer'
require_relative 'adder'
require_relative 'remover'
require_relative 'printer'

require_relative 'error/config_file_does_not_exist_error'

module Annoyme
  class CLI < Thor
    desc 'init', 'initialize your annoyme instance'
    long_desc <<-LONG_DESC
      `annoyme init` will initialize an .annoyme file in your
      home directory and link it with your .bashrc/.zshrc file.
      It will store your notes as echo commands there which will be
      printed out whenever you start a new terminal
    LONG_DESC
    def init
      initializer = Initializer.new(notes_file)
      initializer.perform
    end

    desc 'add NOTE', 'add NOTE to your terminal notes'
    long_desc <<-LONG_DESC
      `annoyme add` adds a new note to your terminal notes. Make sure that you
      are passing the required note correctly.

      Example Usage:

      $ annoyme add "Buy mom a present"
    LONG_DESC
    def add(note)
      check_config_file
      Adder.new(notes_file).add(note)
    end

    desc 'remove NOTE', 'remove the note given by its number'
    long_desc <<-LONG_DESC
      `annoyme remove` removes a note from your terminal notes. It expects the
      number of the note to be passed to the command.

      Example Usage:

      $ annoyme remove 1
    LONG_DESC
    def remove(note)
      check_config_file
      Remover.new(notes_file).remove(note)
    end

    desc 'print', 'prints all notes - will be placed in .bashrc/.zshrc file'
    long_desc <<-LONG_DESC
      `annoyme print` prints all stored notes to the terminal. This command is
      generally written into your shellfile when using annoyme to print all
      notes whenever you open a new terminal

      Example Usage:

      $ annoyme print
    LONG_DESC
    def print
      check_config_file
      Printer.new(notes_file).print
    end

    private

    def check_config_file
      unless notes_file.exists?
        raise Error::ConfigFileDoesNotExistError, 'The annoyme file does not exist. Try running `annoyme init`'
      end
    end

    def notes_file
      @notes_file ||= NotesFile.new(DEFAULT_NOTES_FILE)
    end
  end
end

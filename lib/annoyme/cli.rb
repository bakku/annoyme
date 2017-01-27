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
      initializer = Initializer.new
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
      Adder.add(note)
    end

    desc 'remove NOTE', 'remove the note given by its number'
    def remove(note)
      check_config_file
      Remover.remove(note)
    end

    desc 'print', 'prints all notes - will be placed in .bashrc/.zshrc file'
    def print
      check_config_file
      Printer.print
    end

    private

    def check_config_file
      unless ConfigFile.exists?
        raise Error::ConfigFileDoesNotExistError, 'The annoyme file does not exist. Try running `annoyme init`'
      end
    end

  end

end

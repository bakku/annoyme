require 'thor'

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
      puts 'init'
    end

    desc 'add NOTE', 'add NOTE to your terminal notes'
    long_desc <<-LONG_DESC
      `annoyme add` adds a new note to your terminal notes. Make sure that you
      are passing the required note correctly.

      Example Usage:

      $ annoyme add "Buy mom a present"
    LONG_DESC
    def add(note)
      puts "add #{note}"
    end

    desc 'list', 'list all available notes'
    def list
      puts 'list'
    end

    desc 'remove NOTE', 'remove the note given by its number'
    def remove(note)
      puts "remove #{note}"
    end

    desc 'print', 'prints all notes - will be placed in .bashrc/.zshrc file'
    def print
      puts "print"
    end
    
  end

end

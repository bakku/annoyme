require_relative 'notes_file'
require_relative 'logger'
require_relative 'shell_file_appender'
require_relative 'error/shell_not_supported_error'

module Annoyme
  class Initializer

    def initialize
      detect_shell
    end

    def perform
      create_annoyme_file
      add_annoyme_print_to_shell_file
    end

    private

    def detect_shell
      case ENV['SHELL']
      when '/bin/bash'
        @shell = :bash
        @file = File.join(ENV['HOME'], '.bashrc')
      when '/bin/zsh'
        @shell = :zsh
        @file = File.join(ENV['HOME'], '.zshrc')
      else
        raise Error::ShellNotSupportedError, 'Your shell is not supported by annoyme. You can submit an issue at the github page'
      end
    end

    def create_annoyme_file
      if ConfigFile.exists?
        Logger.red('replaced', '.annoyme')
      else
        Logger.green('created', '.annoyme')
      end

      ConfigFile.create
    end

    def add_annoyme_print_to_shell_file
      appender = ShellFileAppender.new(@file)
      appender.append_command
    end

  end
end

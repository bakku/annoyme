module Annoyme

  class Initializer

    def initialize
      detect_shell
    end

    def perform
      puts @shell
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
        raise ShellNotSupportedError, 'Your shell is not supported by annoyme. You can submit an issue at the github page'
      end
    end

    class ShellNotSupportedError < RuntimeError
    end

  end

end

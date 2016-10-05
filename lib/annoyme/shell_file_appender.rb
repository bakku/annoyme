require_relative 'logger'

module Annoyme

  class ShellFileAppender

    COMMAND_TO_APPEND = 'annoyme print'

    def initialize(path)
      @path = path
    end

    def append_command
      if command_missing?
        append_annoyme_command
        Logger.yellow('modified', @path.split('/').last)
      end
    end

    private

    def command_missing?
      File.foreach(@path) do |line|
        if line.strip == COMMAND_TO_APPEND
          return false
        end
      end

      true
    end

    def append_annoyme_command
      File.open(@path, 'a') do |f|
        f.puts "\n# so annoyme gets executed on startup"
        f.puts "annoyme print"
      end
    end

  end

end

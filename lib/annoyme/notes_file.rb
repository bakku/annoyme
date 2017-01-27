require 'json'

module Annoyme
  class NotesFile
    def initialize(path)
      @path = path
    end

    def create
      File.open(@path, 'w') do |f|
        f.write("[]")
      end
    end

    def exists?
      File.exist?(@path)
    end

    def parse
      content = File.readlines(@path).first
      JSON.parse(content)
    rescue JSON::ParserError
      raise 'notes file seems to be corrupted'
    end

    def write(content)
      File.open(@path, 'w') do |f|
        f.write(content)
      end
    end
  end
end

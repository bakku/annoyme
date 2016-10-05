require 'json'

module Annoyme

  class ConfigFile

    ANNOYME_FILE_PATH = "#{ENV['HOME']}/.annoyme"

    def self.create
      File.open(ANNOYME_FILE_PATH, 'w') do |f|
        f.write("[]")
      end
    end

    def self.exists?
      File.exist?(ANNOYME_FILE_PATH)
    end

    def self.parse
      content = File.foreach(ANNOYME_FILE_PATH).first
      JSON.parse(content)
    end

    def self.write(content)
      File.open(ANNOYME_FILE_PATH, 'w') do |f|
        f.write(content)
      end
    end

  end

end

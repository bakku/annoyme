module Annoyme

  class ConfigFile

    ANNOYME_FILE_PATH = "#{ENV['HOME']}/.annoyme"

    def self.create
      File.open(ANNOYME_FILE_PATH, "w") do |f|
        f.write("[]")
      end
    end

    def self.exists?
      File.exist?(ANNOYME_FILE_PATH)
    end

  end

end

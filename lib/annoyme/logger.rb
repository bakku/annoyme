require 'rainbow'

module Annoyme

  class Logger

    def self.green(change, text)
      puts "#{Rainbow("\t#{change}\t").green.bright}\t#{text}"
    end

    def self.red(change, text)
      puts "#{Rainbow("\t#{change}\t").red.bright}\t#{text}"
    end

    def self.yellow(change, text)
      puts "#{Rainbow("\t#{change}\t").yellow.bright}\t#{text}"
    end

  end

end

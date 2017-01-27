require 'rainbow'

module Annoyme
  class Logger
    def self.green(change, text)
      puts "#{Rainbow("\t#{change}\t").green.bright}\t#{text}" unless silent?
    end

    def self.red(change, text)
      puts "#{Rainbow("\t#{change}\t").red.bright}\t#{text}" unless silent?
    end

    def self.yellow(change, text)
      puts "#{Rainbow("\t#{change}\t").yellow.bright}\t#{text}" unless silent?
    end

    def self.colored(text, color)
      puts Rainbow(text).send(color) unless silent?
    end

    def self.print_array_colorful(array, with_index: false)
      unless silent?
        array.each_with_index do |element, i|
          if with_index
            colored("  #{i+1}.\t#{element}", current_colorful_color(i))
          else
            colored("  #{element}", current_colorful_color(i))
          end
        end
      end
    end

    private

    def silent?
      ENV['SILENT'] == 'true'
    end

    def self.current_colorful_color(i)
      colorful_hash[i % 4]
    end

    def self.colorful_hash
      {
        0 => :green,
        1 => :red,
        2 => :yellow,
        3 => :cyan
      }
    end
  end
end

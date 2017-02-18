# Annoyme

Annoyme is basically `echo "Buy present for mom" >> .bashrc` in an improved form. It is a small tool to write notes or todos on the command line and have them listed each time a new terminal gets opened.

## Installation

Run

    $ gem install annoyme

to install annoyme on your local machine.

## Usage

After installation, annoyme has to register itself in your specific shell. Currently `zsh` and `bash` are supported. Furthermore annoyme will create a file to which it will save its notes. This file is located at `$HOME/.annoyme`. To do all of this initialization work the program provides an `init` command:

    $ annyome init
    
New notes/todos can be added afterwards:

    $ annoyme add "Buy mom a present"
    	added		Buy mom a present
    $ annoyme add "Make an appointment with dentist"
        added       Make an appointment with dentist
    
Open a new terminal:

    Last login: Sat Feb 18 10:50:35 on ttys004

    TODO

        1.	Buy mom a present
        2.	Make an appointment with dentist

Remove notes:

    $ annoyme remove 1
        deleted     Buy mom a present
    
## Development

Annoyme uses `guard` and `rspec` as testing tools. Guard will run for each change only the specs of the file that was modified.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bakku/annoyme. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


[![Gem Version](https://badge.fury.io/rb/json_cat.svg)](https://badge.fury.io/rb/json_cat)

# JsonCat

Pretty print JSON files and standard input

Format JSON to be easier to read; colorize, sort keys, etc.

## Installation

    $ gem install json_cat

## Usage

    $ json_cat -h
    Usage: json_cat [options]
        -c, --[no-]color                 Colorize output (default: --color)
            --grep key                   Filter out JSON without key
        -h, --help                       Prints this help
        -o, --omit key[,key]             Omit keys from JSON
        -p, --parse key[,key]            Parse Key-value as JSON
        -s, --[no-]sort                  Sort keys
        -t, --[no-]timestamp             Timestamp lines

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sanscore/json_cat.


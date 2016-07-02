require 'json'
require 'rainbow'

require "json_cat/version"
require "json_cat/ext/array"
require "json_cat/ext/hash"
require "json_cat/ext/kernel"
require "json_cat/ext/object"

module JsonCat
  COLORS = %i(blue chartreuse cornflower red green darkviolet
    orangered magenta yellow cyan coral limegreen dodgerblue
    gold indigo)

  class JsonPrettyPrinter
    attr_accessor :count, :grep, :omit, :parse, :sort, :timestamp
    def initialize(**opts)
      self.count = 0
      opts.each { |k,v| self.instance_variable_set("@#{k}", v) }
    end

    def print(line)
      x = json_parse(line)
      if x.is_a?(Hash)
        print_hash(x)
      else
        bow_print x
      end
    end

  private
    def print_hash(json)
      return if grep and not json[grep]
      self.count += 1

      x = json.delete_if { |k,v| omit.include?(k) }
      x.each {|k,v| x[k] = parse.include?(k) ? json_parse(v) : v }
      x = x.sort.to_h if sort

      if timestamp
        x = {"timestamp": Time.now.httpdate, "line-#{count}": x}
      end
      bow_print x
    end

    def json_parse(json)
      return json if json.nil?
      JSON.parse(json)
    rescue JSON::ParserError
      json
    end
  end
end

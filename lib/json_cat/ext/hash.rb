# encoding: utf-8
require 'pp'

class Hash
  def rainbow_print(level=0)
    return Rainbow('{}').color(JsonCat::COLORS[level]) if length == 0
    rainbow_print_build(level)
  end

private

  def rainbow_print_open_bracket(level)
    Rainbow('{').color(JsonCat::COLORS[level])
  end

  def rainbow_print_close_bracket(level)
    Rainbow('}').color(JsonCat::COLORS[level])
  end

  def rainbow_print_build(level)
    ret = [rainbow_print_open_bracket(level)]
    each do |k, v|
      rkey = k.rainbow_print(level + 1)
      rval = v.rainbow_print(level + 2)

      ret << "  #{rkey}: #{rval.gsub(/\n/, "\n  ")},"
    end
    ret << rainbow_print_close_bracket(level)
    ret.join("\n")
  end
end

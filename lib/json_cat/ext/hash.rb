# encoding: utf-8

class Hash
  def rainbow_print(level=0)
    indent = ' ' * (level * 2)
    if length == 0
      return "#{indent}#{Rainbow('{}').color(JsonCat::COLORS[level])}"
    end

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
      indent = ' ' * ((level + 1) * 2)
      rkey = k.rainbow_print(level + 1)
      rval = v.rainbow_print(level + 2).lstrip
      ret << "#{indent}#{rkey}: #{rval},"
    end
    ret << rainbow_print_close_bracket(level)
    ret.join("\n")
  end
end

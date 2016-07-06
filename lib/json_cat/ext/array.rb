# encoding: utf-8

class Array
  def rainbow_print(level=0)
    return Rainbow('[]').color(JsonCat::COLORS[level]) if length == 0
    rainbow_print_build(level)
  end

  if RUBY_VERSION < '2.1'
    def to_h
      Hash[*flatten]
    end
  end

private

  def rainbow_print_open_bracket(level)
    Rainbow('[').color(JsonCat::COLORS[level])
  end

  def rainbow_print_close_bracket(level)
    Rainbow(']').color(JsonCat::COLORS[level])
  end

  def rainbow_print_build(level)
    ret = [rainbow_print_open_bracket(level)]
    each do |elem|
      val = elem.rainbow_print(level + 1)

      ret << "  #{val.gsub(/\n/, "\n  ")},"
    end
    ret << rainbow_print_close_bracket(level)
    ret.join("\n")
  end
end

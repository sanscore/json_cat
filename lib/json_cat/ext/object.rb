# encoding: utf-8

class Object
  def rainbow_print(level=0)
    Rainbow(to_json).color(JsonCat::COLORS[level])
  end
end

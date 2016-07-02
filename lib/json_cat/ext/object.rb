
class Object
  def rainbow_print(level=0)
    return "#{Rainbow(self.to_json).color(JsonCat::COLORS[level])}"
  end
end


class Hash
  def rainbow_print(level=0)
    indent = ' ' * (level * 2)
    if self.length == 0
      return "#{indent}#{Rainbow("{}").color(JsonCat::COLORS[level])}"
    end

    open_br = "#{indent}#{Rainbow("{").color(JsonCat::COLORS[level])}"
    close_br = "#{indent}#{Rainbow("}").color(JsonCat::COLORS[level])}"

    ret = [open_br]
    self.each do |k, v|
      indent = ' ' * ((level + 1) * 2)
      rkey = k.rainbow_print(level+1)
      rval = v.rainbow_print(level+2).lstrip
      ret << "#{indent}#{rkey}: #{rval},"
    end
    ret << close_br
    return ret.join("\n")
  end
end

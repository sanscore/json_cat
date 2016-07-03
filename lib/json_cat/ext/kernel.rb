# encoding: utf-8

module Kernel
  def bow_print(*objs)
    objs.each do |obj|
      puts obj.rainbow_print
    end
    objs.size <= 1 ? objs.first : objs
  end
  module_function :bow_print
end

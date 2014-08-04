require "ladyboy/version"
require "unicode"

module Ladyboy
  extend self

  SEX = {
    1 => :male,
    2 => :female
  }

  def root
    File.expand_path("../../", __FILE__)
  end

  def names
    @names ||= begin
      n = {}
      fn = File.join(root, "data", "name2name.csv")
      File.read(fn).each_line do |line|
        nick, name, type = line.chomp.split(",")
        n[nick] = name  if type == "first"
      end
      n
    end
  end

  def sexes
    @sexes ||= begin
      s = {}
      fn = File.join(root, "data", "name2sex.csv")
      File.read(fn).each_line.with_index do |line, priority|
        name, sex = line.chomp.split(",")
        sex = sex.to_i
        s[name] = [sex, priority] if SEX[sex]
      end
      s
    end
  end
end

require File.join(Ladyboy.root, 'lib', 'ladyboy', 'parser')
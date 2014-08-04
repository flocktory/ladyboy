require "ladyboy/version"
require "unicode"

module Ladyboy
  extend self

  SEX = {
    0 => nil,
    1 => :male,
    2 => :female
  }

  def root
    File.expand_path("../../", __FILE__)
  end

  def names
    @names ||= begin
      n = {}
      # https://github.com/flocktory/Rinatolytics/blob/master/social/names_substitutes.csv
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
      # https://github.com/flocktory/Rinatolytics/blob/master/social/firstnames.csv
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
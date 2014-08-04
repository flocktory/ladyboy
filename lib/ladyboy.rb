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

  def sex_for_name(name)
    name = normalize_name(name)
    sex_for_normalized_name(name)
  end

  def sex_for_normalized_name(name)
    (s = sexes[name]) and SEX[s[0]]
  end

  def normalize_name(name)
    name = Unicode.downcase(name.to_s).gsub(/\d+/, '') # .gsub("ё", "е")
    names[name] or sexes[name] && name
  end

  def get_first_name(full_name)
    major = major_name_and_sex_for_full_name(full_name)
    major.first if major
  end

  def sex_for_full_name(full_name)
    major = major_name_and_sex_for_full_name(full_name)
    SEX[major[1]] if major
  end

  private

  def major_name_and_sex_for_full_name(full_name)
    full_name.to_s.scan(/[[:word:]]+/).map do |token|
      name = normalize_name(token)
      sex = sexes[name]
      [name, *sex] if sex
    end.compact.sort_by(&:last).first
  end
end

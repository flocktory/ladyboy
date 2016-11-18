module Ladyboy
  class Parser
    attr_reader :first_name, :gender, :full_name
    alias_method :sex, :gender

    def initialize(full_name)
      @full_name = full_name
      parse!
    end

    private

    def normalize_name(name)
      name = Unicode.downcase(name.to_s).gsub(/\d+/, '').tr(
        "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
        "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz"
      ) # .gsub("ё", "е")
      Ladyboy.names[name] or 
        (Ladyboy.sexes[name] && name) or 
        (Ladyboy.sexes_es[name] && name)
    end

    def parse!
      major = major_name_and_sex_for_full_name(@full_name)
      return unless major

      @first_name = major[0].split(" ").map{|m| Unicode.capitalize(m) } * " " if major[0]
      @gender = SEX[major[1]]
    end

    def major_name_and_sex_for_full_name(full_name)
      tokens = full_name.to_s.scan(/[[:word:]]+/)
      [2, 1].map do |size|
        tokens.each_cons(size).map do |slice|
          token = slice * " "
          name = normalize_name(token)
          if name
            sex = Ladyboy.sexes[name] || Ladyboy.sexes_es[name] || [nil, Float::INFINITY]
            [name, *sex, -size]
          end
        end
      end.flatten(1).compact.sort_by{ |n| [n[3], n[2]] }.first
    end
  end
end
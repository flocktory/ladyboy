module Ladyboy
  class Parser
    attr_reader :first_name, :gender, :full_name

    def initialize(full_name)
      @full_name = full_name
      parse!
    end

    private

    def normalize_name(name)
      name = Unicode.downcase(name.to_s).gsub(/\d+/, '') # .gsub("ё", "е")
      Ladyboy.names[name] or Ladyboy.sexes[name] && name
    end

    def parse!
      major = major_name_and_sex_for_full_name(@full_name)
      return unless major

      @first_name = Unicode.capitalize(major[0])
      @gender = SEX[major[1]]
    end

    def major_name_and_sex_for_full_name(full_name)
      full_name.to_s.scan(/[[:word:]]+/).map do |token|
        name = normalize_name(token)
        sex = Ladyboy.sexes[name]
        [name, *sex] if sex
      end.compact.sort_by(&:last).first
    end
  end
end
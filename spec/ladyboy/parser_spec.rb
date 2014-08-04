require 'spec_helper'

describe Ladyboy::Parser do
  it do
    example = Ladyboy::Parser.new 'Петр'
    example.first_name.must_equal 'Петр'
    example.gender.must_equal     :male
    example.sex.must_equal        :male    # alias to gender

    example = Ladyboy::Parser.new 'Оля'
    example.first_name.must_equal 'Ольга'
    example.gender.must_equal     :female

    example = Ladyboy::Parser.new 'zhenya'
    example.first_name.must_equal 'Женя'
    example.gender.must_equal     nil      # unisex

    example = Ladyboy::Parser.new 'Саша'
    example.first_name.must_equal 'Саша'
    example.gender.must_equal     nil

    example = Ladyboy::Parser.new 'Рамзанкадыров'
    example.first_name.must_equal nil
    example.gender.must_equal     nil

    example = Ladyboy::Parser.new 'пётр, Абулгары  Эрнест '
    example.first_name.must_equal 'Петр'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'Абулгары  Эрнест!'
    example.first_name.must_equal 'Эрнест'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'Пётр, Абулгары  Наташа!'
    example.first_name.must_equal 'Наталья'
    example.gender.must_equal     :female

    example = Ladyboy::Parser.new 'Рамзанкадыров Тут Проходил'
    example.first_name.must_equal nil
    example.gender.must_equal     nil

    example = Ladyboy::Parser.new 'vasya1985@mail.ru'
    example.first_name.must_equal 'Василий'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'kolya.petrov@google.com'
    example.first_name.must_equal 'Николай'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'olga.petrov@yandex.ru'
    example.first_name.must_equal 'Ольга'
    example.gender.must_equal     :female

    example = Ladyboy::Parser.new 'dark.imperior@live.com'
    example.first_name.must_equal nil
    example.gender.must_equal     nil

    example = Ladyboy::Parser.new nil
    example.first_name.must_equal nil
    example.gender.must_equal     nil
  end
end
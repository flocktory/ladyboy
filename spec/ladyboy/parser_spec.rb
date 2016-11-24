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

    example = Ladyboy::Parser.new 'Пётр, Абулгары Наташа!'
    example.first_name.must_equal 'Петр'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'Наташа Пётр, Абулгары!'
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

    example = Ladyboy::Parser.new 'Jesus'
    example.first_name.must_equal 'Jesus'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'Buendia Francisco Javier'
    example.first_name.must_equal 'Francisco Javier'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'Kilian Byszio'
    example.first_name.must_equal 'Килиан'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'César Hernández'
    example.first_name.must_equal 'Cesar'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'Mayte Nogales Martin'
    example.first_name.must_equal 'Mayte'
    example.gender.must_equal     :female

    example = Ladyboy::Parser.new 'Paula San Gregorio'
    example.first_name.must_equal 'Paula'
    example.gender.must_equal     :female

    example = Ladyboy::Parser.new 'ENRIC VILA SAGUE'
    example.first_name.must_equal 'Enric'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new 'Jose Maria de la Peña'
    example.first_name.must_equal 'Jose Maria'
    example.gender.must_equal     :male

    example = Ladyboy::Parser.new nil
    example.first_name.must_equal nil
    example.gender.must_equal     nil

    [["Daniel", :female],
    ["Mayte Nogales", :male],
    ["Andrea", :male],
    ["Jesús Rosa Lázaro", :female],
    ["Patricia", :male],
    ["Andrea", :male],
    ["ENRIC VILA SAGUE", :female],
    ["Andrea", :male],
    ["andrea sanchez gadea", :male],
    ["Patricia", :male],
    ["BELÉN", :male],
    ["Mohamed", :female],
    ["Rodrigo Crespo", :female],
    ["Jose Maria de la Peña", :female],
    ["Belen", :male],
    ["Jose Maria", :female],
    ["Carmen", :male],
    ["Andrea", :male],
    ["Carmen", :male],
    ["Andrea", :male],
    ["guillermo tamayo", :female],
    ["Carmen", :male],
    ["Alejandro", :female],
    ["alberto", :female],
    ["Belén Baztan", :male],
    ["Andrea", :male],
    ["Carmen", :male],
    ["ari", :male],
    ["Patricia", :male],
    ["carol", :male],
    ["carmen", :male],
    ["Inma Vidal", :male],
    ["Alba franco", :male],
    ["Carmen", :male],
    ["carmen", :male],
    ["cristina ferrandiz clemente", :male],
    ["Carmen", :male],
    ["Paola marin", :male],
    ["Génesis ", :male],
    ["Andrea López villalba", :male],
    ["Carmen", :male],
    ["Guadalupe", :male],
    ["M carmen", :male],
    ["Andrea", :male],
    ["belen", :male],
    ["Miriam alonso civera", :male],
    ["Victoria", :male],
    ["Pilar", :male],
    ["Patricia", :male],
    ["Cristina Lorenzo", :male],
    ["Teresa García- Roca", :male],
    ["Andrea Roca ", :male]].each do |name, sex|
      example = Ladyboy::Parser.new name
      [name, example.gender].must_equal     [name, {male: :female, female: :male}[sex]]
    end
    [
      ["Azulema", :female],
      ["Mariuxi Navarrete", :female],
      ["Rubsay Azócar", :female],
      ["Mariate", :male],
      ["Arenosky ", :male],
      ["Stef ", :female],
      ["Rodri", :male],
      ["Sofía", :female],
      ["Sofía", :female],
      ["Anhara ", :female],
      ["Fer", :male],
      ["Guille ", :male],
      ["Zhuraida ", :female],
      ["Yayo Garrido Gómez ", :male],
      ["Muels", :male],
      ["Luis blazquez lizan", :male],
      ["Luis Blazquez Lizan", :male],
      ["Pilar", :female],
      ["Elia ", :female],
      ["Fernando ", :male],
      ["Carlos ", :male],
      ["Pablo  ", :male],
      ["Inés Tardy ", :female],
      ["Pablo Judez", :male],
      ["Carolina Borrajo Yusty ", :female],
      ["Begoña ", :female],
      ["Mer", :female],
      ["Guille ", :male],
      ["Yaya ", :male],
      ["Ricky", :male],
      ["Yago ", :male],
      ["Noèlia ", :female],
      ["Cris ", :female],
      ["Eulogio", :male],
      ["Pablo", :male],
      ["Diarmuid ", :male],
      ["Diarmuid ", :male],
      ["Blanca Leach ", :female],
      ["Teresa ", :female],
      ["Almudena ", :female],
      ["pau llorca ", :male],
      ["Rodrigo", :male],
      ["Nuria", :female],
      ["Ángel", :male],
      ["Juancho", :male],
      ["rafaverguis", :male],
      ["Almudena ", :female],
      ["Alejandro", :male],
      ["Santiago Vázquez ", :male],
      ["Anabel ", :female],
      ["Javila ", :male],
      ["teresa ", :female],
      ["Sofia Herrera", :female],
      ["Manuel Esparza ", :male],
      ["iciar", :female],
      ["Fernando ", :male],
      ["Alberto", :male],
      ["Ignacio  ", :male]].each do |name, sex|
      example = Ladyboy::Parser.new name
      [name, example.gender].must_equal     [name, sex]
    end
  end
end
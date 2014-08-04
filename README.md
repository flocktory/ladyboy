# Ladyboy

* Определяем пол по имени
* Определяем пол по полному имени
* Определяем имя по полному имени
* Определяем имя по email

## Installation

Add this line to your application's Gemfile:

    gem 'ladyboy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ladyboy

## Usage

```ruby
describe Ladyboy do
  it do
    example = Ladyboy::Parser.new('Петр')
    example.first_name.must_equal 'петр'
    example.gender.must_equal :male

    example = Ladyboy::Parser.new('Оля')
    example.first_name.must_equal 'ольга'
    example.gender.must_equal :female

    example = Ladyboy::Parser.new('Рамзанкадыров')
    example.first_name.must_equal nil
    example.gender.must_equal nil

    example = Ladyboy::Parser.new(' Пётр, Абулгары  Эрнест ')
    example.first_name.must_equal 'петр'
    example.gender.must_equal :male

    example = Ladyboy::Parser.new(' Абулгары  Эрнест!')
    example.first_name.must_equal 'эрнест'
    example.gender.must_equal :male

    example = Ladyboy::Parser.new('Пётр, Абулгары  Наташа!')
    example.first_name.must_equal 'наталья'
    example.gender.must_equal :female

    example = Ladyboy::Parser.new('Рамзанкадыров Тут Проходил')
    example.first_name.must_equal nil
    example.gender.must_equal nil

    example = Ladyboy::Parser.new('vasya1985@mail.ru')
    example.first_name.must_equal 'василий'
    example.gender.must_equal :male

    example = Ladyboy::Parser.new('kolya.petrov@google.com')
    example.first_name.must_equal 'николай'
    example.gender.must_equal :male

    example = Ladyboy::Parser.new('olga.petrov@yandex.ru')
    example.first_name.must_equal 'ольга'
    example.gender.must_equal :female

    example = Ladyboy::Parser.new('dark.imperior@live.com')
    example.first_name.must_equal nil
    example.gender.must_equal nil
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ladyboy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

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
  let(:name1) { 'Пётр' }
  let(:name2) { 'Оля' }
  let(:name3) { 'Рамзанкадыров' }
  let(:full_name1) { ' Пётр, Абулгары  Эрнест ' }
  let(:full_name2) { ' Абулгары  Эрнест!' }
  let(:full_name3) { ' Пётр, Абулгары  Наташа ' }
  let(:full_name4) { ' Рамзанкадыров Тут Проходил ' }
  let(:email1) { 'vasya1985@mail.ru' }
  let(:email2) { 'kolya.petrov@google.com' }
  let(:email3) { 'dark.imperior@live.com' }

  describe '.normalize_name' do
    it 'преобразуем ё в е, приводим к нижнему регистру уираем лишние знаки припенания' do
      Ladyboy.normalize_name(name1).must_equal "петр"
      Ladyboy.normalize_name(name2).must_equal "ольга"
      Ladyboy.normalize_name(name3).must_equal nil
      Ladyboy.normalize_name(nil).must_equal nil
    end
  end

  describe 'get_first_name' do
    it 'вернет более вероятное имя' do
      Ladyboy.get_first_name(full_name1).must_equal "петр"
      Ladyboy.get_first_name(full_name2).must_equal "эрнест"
      Ladyboy.get_first_name(full_name3).must_equal "наталья"
      Ladyboy.get_first_name(full_name4).must_equal nil
      Ladyboy.get_first_name(nil).must_equal nil
    end

    it 'должен парсить емэйлы' do
      Ladyboy.get_first_name(email1).must_equal "василий"
      Ladyboy.get_first_name(email2).must_equal "николай"
      Ladyboy.get_first_name(email3).must_equal nil
    end
  end

  describe '.sex_for_name' do
    it 'вернет наиболее вероятный пол для имени' do
      Ladyboy.sex_for_name(name1).must_equal :male
      Ladyboy.sex_for_name(name2).must_equal :female
      Ladyboy.sex_for_name(name3).must_equal nil
      Ladyboy.sex_for_name(nil).must_equal nil
    end
  end

  describe '.sex_for_full_name' do
    it 'найдет наиболее вероятное имя и его пол' do
      Ladyboy.sex_for_full_name(full_name1).must_equal :male
      Ladyboy.sex_for_full_name(full_name2).must_equal :male
      Ladyboy.sex_for_full_name(full_name3).must_equal :female
      Ladyboy.sex_for_full_name(full_name4).must_equal nil
      Ladyboy.sex_for_full_name(nil).must_equal nil
    end
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ladyboy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

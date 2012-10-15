# Vydumschik (Выдумщик) [![Travis CI status](https://secure.travis-ci.org/leonid-shevtsov/vydumschik.png)](http://travis-ci.org/leonid-shevtsov/vydumschik)

This gem generates fake data for database population in Russian. It probably won't be of any use to you if you don't know the language.

`Vydumschik`- гем, выдумывающий случайные данные для наполнения баз данных. Вдохновлен гемом [`ffaker`](http://rubygems.org/gems/ffaker).

## Установка

Зависимостей гем не имеет - но **(!)** - работает исключительно с кодировкой UTF-8.

    gem install vydumschik

## Имена

    > require 'vydumschik'

    > Vydumschik::Name.first_name
    "Филипп"

    > Vydumschik::Name.middle_name(:female)
    "Артёмовна"

    > Vydumschik::Name.surname
    "Шарапов"

    > Vydumschik::Name.full_name
    "Королёва Устиния Панкратиевна"

## Адреса

    > Vydumschik::Address.street
    "ул. Парниковая"

    > Vydumschik::Address.street_address
    "ул. Линейная, д. 50, кв. 9"

    > Vydumschik::Address.street_address
    "ул. Нефтяников, 36/14"

    > Vydumschik::Address.street_address
    "ул. Войкова, д. 1"

## Лорем ипсум

    > Vydumschik::Lorem.word
    "жиганир"

    > Vydumschik::Lorem.sentence
    "Инекуле тято авитудаз еде агар."

    > Vydumschik::Lorem.paragraph
    "Орэнет емех рахетик копорун хетег динава. Оте балале утир лелунака азуло
    илувап. Татиройы отедечу ыжа омотокях мизота. Исяр одокыдика оненен итотип
    осякелоза ув онежорес ресовинон. Уто ате обю иро авушытяса енесета ран
    конекесуг омат. Хованово диномиг лодер ивен косе еламалип са тин. Ойон
    анаро совизоцюч деке есе дажочи. Екечовено лета рак оня онал."


(c) 2011 [Leonid Shevtsov](http://leonid.shevtsov.me)

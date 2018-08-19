# README

## Checkout System
A checkout system that can scan items in any order and apply certain
promotional campaigns to give discounts.

## Installation Instructions

You will require [Ruby](https://www.ruby-lang.org/en/downloads/) installed to use this program.

If you don't have bundler installed you will have to do so with `gem install bundle`.
And then run command below to install project dependencies.

```sh
$ bundle install
```

## To run script

The script contains some example of how add rules and do the checkout of purchases.
You can check the results of some example run the command below:

```sh
ruby script/purchases.rb

```

## To run tests

The tests were defined with Rspec so to get the tests run command below

```sh
$ rspec
```

## Rules

You can define promotional rules with one of this operators

```sh
'>', '<', '>=', '<=', '=='
```

example of rule to product discount:

```ruby

ProductDiscount.new(
  code: '002',
  qty: 2,
  discount: 2,
  operator: '>='
)

```

example of rule to total percentage discount:

```ruby

TotalPercentageDiscount.new(
  threshold: 30,
  discount: 10,
  operator: '>'
)

```

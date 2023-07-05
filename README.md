# Checkout System

This is a simple implementation of a checkout system for a supermarket. This system allows for flexible pricing rules, where items can be scanned in any order and discounts are applied dynamically.

## Requirements

This project requires:
- Bundler version 2.3.7
- Ruby version 3.1.2
- Minitest version ~> 5.14

## Installation

First, clone the repository to your local machine:

```
$ git clone git@github.com:caiohenrique12/supermarket-challenger.git
```

Install the required gems using bundler:

```
$ bundle install
```

## Usage

You can create a new checkout with the pricing rules, scan items, and get the total cost as follows:

```ruby
co = Checkout.new(Product::PRICING_RULES)
co.scan("item_code")
co.scan("another_item_code")
price = co.total
```

## Running Tests

This project uses Minitest for testing. To run the tests, simply execute the following command in the root directory of the project:

```
$ ruby test/test_checkout.rb
```
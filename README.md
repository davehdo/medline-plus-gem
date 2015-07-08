# MedlinePlus Gem

An easy way to get medication information from the MedlinePlus API

https://rubygems.org/gems/medline_plus

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'medline_plus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install medline_plus

## Usage
The following line
```
MedlinePlus.find_drug_by_name("aspirin")
```
returns an array of hashes
```
[{title: "Notice:",body: "Content..."}, ... ]
```

The section titles are as follows:

- Notice:
- Why is this medication prescribed?
- How should this medicine be used?
- Other uses for this medicine
- What special precautions should I follow?
- What special dietary instructions should I follow?
- What should I do if I forget a dose?
- What side effects can this medication cause?
- What should I know about storage and disposal of this medication?
- In case of emergency/overdose
- What other information should I know?
- Brand names
- Brand names of combination products
- Other names

## Contributing

1. Fork it ( https://github.com/[my-github-username]/medline_plus/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

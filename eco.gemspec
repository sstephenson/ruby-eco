Gem::Specification.new do |s|
  s.name        = "eco"
  s.version     = "1.0.0"
  s.date        = "2011-06-04"

  s.authors     = ["Sam Stephenson"]
  s.email       = "sstephenson@gmail.com"
  s.homepage    = "https://github.com/sstephenson/ruby-eco"

  s.summary     = "Ruby Eco Compiler (Embedded CoffeeScript templates)"
  s.description = <<-EOS
    Ruby Eco is a bridge to the official JavaScript Eco compiler.
  EOS

  s.files = [
    "lib/eco.rb",
    "LICENSE",
    "README.md"
  ]

  s.add_dependency "coffee-script"
  s.add_dependency "eco-source","1.1.0.rc.1"
  s.add_dependency "execjs"
end

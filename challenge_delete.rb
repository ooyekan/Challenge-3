require_relative 'ar.rb'

delete_ram = Product.find_by(name: 'Ram')

puts delete_ram.inspect

delete_ram.destroy  if delete_ram

puts delete_ram.inspect

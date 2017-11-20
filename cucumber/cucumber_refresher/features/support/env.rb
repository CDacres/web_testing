require 'rspec'

Before do
  @veg1 = 'carrot'
  @veg2 = 'beetroot'
end

Before ('@float_strings') do
  puts 'We\'re using floats and strings'
end

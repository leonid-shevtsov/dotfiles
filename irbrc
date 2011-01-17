$VERBOSE = false

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

require 'rubygems'

require 'wirble'
Wirble.init
colors = Wirble::Colorize.colors.merge({
  # set the comma color to blue
  :symbol => :brown,
  :symbol_prefix => :brown
})
# set the colors used by Wirble
Wirble::Colorize.colors = colors
Wirble.colorize

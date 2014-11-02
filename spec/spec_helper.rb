require 'bundler'
Bundler.require(:test, :development)

$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'flatiron-template'
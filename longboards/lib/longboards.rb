### REQUIRED GEMS ###
require 'open-uri'
require 'nokogiri'
require 'pry'

### NAMESPACE MODULE ###
module Longboards
end

### REQUIRED FILES ###
require_relative "./longboards/version"
require_relative "./longboards/boards"
require_relative "./longboards/scraper"
require_relative "./longboards/cli"

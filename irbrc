# print SQL to STDOUT
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end
 
# Autocomplete
require 'irb/completion'
require 'pp'
require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize
 
# Indent
IRB.conf[:AUTO_INDENT] = true

# Prompt behavior
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
 
# History
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
 
# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end


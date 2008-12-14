#===============================================================================
# Much of the platform specific code should be called before Swing is touched.
# The useScreenMenuBar is an example of this.
puts "ATHUNETHNETOHSUETH"
require 'rbconfig'
require 'java'

#===============================================================================
# Platform specific operations, feel free to remove or override any of these
# that don't work for your platform/application

case Config::CONFIG["host_os"]
when /darwin/i # OSX specific code
  java.lang.System.set_property("apple.laf.useScreenMenuBar", "true")
when /^win/i # Windows specific code
when /linux/i # Linux specific code
end

# End of platform specific code
#===============================================================================

puts "WWWWWWWWW"
$LOAD_PATH.unshift File.dirname(__FILE__)
Dir.glob(File.expand_path(File.dirname(__FILE__) + "/../lib/ruby/*/lib")).each do |directory|
  puts "dir #{directory}"
  $LOAD_PATH << directory unless directory =~ /\.\w+$/ #File.directory? is broken in current JRuby for dirs inside jars
end

puts "AAAAAAA"
Dir.glob(File.expand_path(File.dirname(__FILE__) + "/**/**")).each do |directory|
  puts "fok #{directory}"
  $LOAD_PATH << directory unless directory =~ /\.\w+$/ #File.directory? is broken in current JRuby for dirs inside jars
end

require 'manifest'

begin
  require 'ebim'
  require 'gui/main/main_controller'
  puts "aaa"
  MainController.instance.open
  Ebim::Base.new
  puts "wwaa"
  # Your app logic here, i.e. YourController.instance.open
rescue Exception => e
  $stderr << "Error in application:\n#{e}\n#{e.message}"
  $stderr << "  Back: #{e.backtrace.join("\n")}"
  # Additional error handling goes here
  java.lang.System.exit(1)
end
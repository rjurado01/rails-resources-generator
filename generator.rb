require 'fileutils'
require 'active_support/inflector'

# ruby Post /home/rjurado/publicapp

def underscore(string)
  string.gsub(/::/, '/').
  gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
  gsub(/([a-z\d])([A-Z])/,'\1_\2').
  tr("-", "_").
  downcase
end

resource = ARGV[0]
path = ARGV[1]
name = underscore(resource)

files = [
  {origin: 'model.rb', dest: "app/models/#{name}.rb"},
  {origin: 'model_spec.rb', dest: "spec/models/#{name}_spec.rb"},
  {origin: 'controller.rb', dest: "app/controllers/#{name.pluralize}_controller.rb"},
  {origin: 'controller_spec.rb', dest: "spec/controllers/#{name.pluralize}_controller_spec.rb"},
  {origin: 'factory.rb', dest: "spec/factories/#{name}.rb"},
  {origin: 'template.rb', dest: "app/representations/templates/#{name}.rb"},
]

files.each do |file|
  text = File.read("templates/#{file[:origin]}")
  text.gsub!("XXX", resource)
  text.gsub!("YYY", resource.pluralize)
  text.gsub!("xxx", name)
  File.open("#{path}/#{file[:dest]}", "w") { |file| file.puts text }
end

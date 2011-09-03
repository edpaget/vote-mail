require 'yaml'
require 'digest/md5'

class YAML_map
  def initialize(hash)
    hash.each do |key, val|
      self.send("#{key}=".intern, val)
    end
    @@folder = self.class
  end

  def self.key(s)
    class_eval( "def #{s}() @#{s}; end" )
    class_eval( "def #{s}=(val) @#{s} = val; end" )
    @@key = s
  end

  def self.fields(*f)
    f.each do |field|
      class_eval( "def #{field}() @#{field}; end" )
      class_eval( "def #{field}=(val) @#{field}; end")
    end
  end

  def key
    @@key
  end

  def save!
    path = "#{@@folder}/#{Digest::MD5.hexdigest(self.send(@@key))}.yml"
    File.open(path, 'w'){ |file| file.write self.to_yaml }
  end

  def self.load(name)
    path = "#{@@folder}/#{Digest::MD5.hexdigest(name)}.yml"
    return YAML::load(File.open(path))
  end

end

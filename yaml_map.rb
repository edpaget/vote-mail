require 'yaml'
require 'digest/md5'

class YAML_map
  def initialize(hash)
    hash.each do |key, val|
      self.send("#{key}=".intern, val)
    end
  end

  def self.key(s)
    class_eval( "def #{s}() @#{s}; end" )
    class_eval( "def #{s}=(val) @#{s} = val; end" )
    class_eval( "def key() :#{s}; end" )
  end

  def self.fields(*f)
    f.each do |field|
      class_eval( "def #{field}() @#{field}; end" )
      class_eval( "def #{field}=(val) @#{field} = val; end" )
    end
  end

  def save!
    path = "#{self.class.name}/#{Digest::MD5.hexdigest(self.send(key))}.yml"
    File.open(path, 'w'){ |file| file.write self.to_yaml }
  end

  def self.load(name)
    path = "#{self.to_s}/#{Digest::MD5.hexdigest(name)}.yml"
    return YAML::load(File.open(path))
  end

end

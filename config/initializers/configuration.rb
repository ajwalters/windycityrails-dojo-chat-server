require 'ostruct'

# From https://www.ruby-forum.com/topic/137104
class NestedOstruct
  def self.new(hash)
    OpenStruct.new(hash.inject({}){|r,p| r[p[0]] = p[1].kind_of?(Hash) ?  NestedOstruct.new(p[1]) : p[1]; r })
  end
end

config = YAML.load_file(Rails.root.join('config', 'application.yml'))[Rails.env].symbolize_keys
AppConfig = NestedOstruct.new(config)


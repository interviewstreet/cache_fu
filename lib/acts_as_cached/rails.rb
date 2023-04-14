
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send(:extend, ActsAsCached::Mixin)
end

if File.exist?(config_file = Rails.root.join('config', 'memcached.yml'))
  ActsAsCached.config = YAML.load(ERB.new(IO.read(config_file)).result)
else
  ActsAsCached.config = {}
end

require 'singleton'
class AppConfig
    include Singleton
    attr_accessor :data

    def version
      '1.0.0'
    end
end


first, second = AppConfig.instance, AppConfig.instance
p "Objects -->"
p first == second

AppConfig.instance.data = {enabled: true}
p AppConfig.instance.version

second = AppConfig.instance # create another instance
second.data = {enabled: false}
p AppConfig.instance.data

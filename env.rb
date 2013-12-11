# Local override
dotenv = File.expand_path("../.env.rb", __FILE__)
require dotenv if File.exist?(dotenv)

ENV["RAILS_ENV"] ||= "development"

ENV["DATABASE_ADAPTER"] ||= "postgresql"
ENV["DATABASE_NAME"] ||= "spreedly_phasers"
ENV["DATABASE_TEST_NAME"] ||= "spreedly_phasers_test"
ENV["DATABASE_USER"] ||= "root"
ENV["DATABASE_PASSWORD"] ||= ""
ENV["DATABASE_ENCODING"] ||= "unicode"

ENV["CORE_ENVIRONMENT_KEY"] ||= "OB9909MNZj62u9U4VAz3lAAPZcp"
ENV["CORE_ACCESS_SECRET"] ||= "MIMo7gJrSi3LnJGdRrOZeBBowXmDVE4zEgyHQS91tIqZiJ2oiy6PRt5XJVXG7hcz"
ENV["CORE_DOMAIN"] ||=  "https://core.spreedly.com"

ENV["CORE_GATEWAY_FOR_CREDIT_CARD"] ||=  "StuXzUJ5Khe3Wes31T0M4uNnjv9"





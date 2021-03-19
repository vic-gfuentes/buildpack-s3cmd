unless ENV["HEROKU_API_KEY"]
  warn "Set HEROKU_API_KEY to your heroku API key (heroku auth:token) (https://github.com/heroku/hatchet)"
  exit 10
end

require "minitest/autorun"
require "hatchet"

class BuildpackTest < MiniTest::Unit::TestCase
  def test_package_is_installed
    Hatchet::Runner.new("app").deploy do |app|
      puts app.output
      assert_match /2\.1\.0/, app.run("s3cmd --version")
    end
  end
end

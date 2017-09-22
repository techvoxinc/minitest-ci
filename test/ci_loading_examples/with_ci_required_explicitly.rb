require 'bundler/inline'

gemfile do
  gem 'minitest'
  gem 'minitest-ci', path: File.expand_path("../../..", __FILE__), require: false
end

require 'minitest/autorun'
require 'minitest/ci'

class WithCiRequiredExplicitlyTest < Minitest::Test
  def test_one
    assert true
  end
end

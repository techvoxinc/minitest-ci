require 'minitest/autorun'
require 'minitest/ci'

require 'stringio'

class MockTestSha1ReportNameSuite < Minitest::Test
  def test_pass
    pass
  end
end

describe 'report with this name should be transformed in sha1' do
 it 'passes' do
   pass
 end
end

$ci_io = StringIO.new
Minitest::Ci.clean = false

# setup test files
reporter = Minitest::Ci.new $ci_io, { :report_name => :sha1 }
reporter.start
Minitest.__run reporter, {}
reporter.report

class TestMinitest; end
class TestMinitest::TestOptions < Minitest::Test
  def test_filename_is_sha1_digest
    sha1 = Digest::SHA1.hexdigest("report with this name should be transformed in sha1")
    assert File.exist? "test/reports/TEST-#{sha1}.xml"
  end
end

class MockTestProcReportNameSuite < Minitest::Test
  def test_pass
    pass
  end
end

describe 'report with this name should be reversed' do
 it 'passes' do
   pass
 end
end

$ci_io = StringIO.new
Minitest::Ci.clean = false

# setup test files
reporter = Minitest::Ci.new $ci_io, { :report_name => -> (name) { "TEST-#{CGI.escape(name.to_s.gsub(/\W+/, '_').reverse)[0, 246]}.xml" } }
reporter.start
Minitest.__run reporter, {}
reporter.report

# Minitest::Runnable.reset

class TestMinitest; end
class TestMinitest::TestOptions < Minitest::Test
  def test_filename_is_from_given_proc
    assert File.exist? "test/reports/TEST-desrever_eb_dluohs_eman_siht_htiw_troper.xml"
  end
end

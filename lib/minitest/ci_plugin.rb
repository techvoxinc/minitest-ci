require 'minitest/ci'

module Minitest

  def self.plugin_ci_init options
    self.reporter << Ci.new(options[:io], options)
  end

  def self.plugin_ci_options opts, options
    opts.on "--ci-dir DIR", "Set the CI report dir. Default to #{Ci.report_dir}" do |dir|
      options[:ci_dir] = dir
    end

    opts.on "--[no-]ci-clean", "Clean the CI report dir in between test runs. Default #{Ci.clean}" do |clean|
      options[:ci_clean] = clean
    end

    opts.on "--working-dir DIR", "Set the working dir. Default to #{Ci.working_dir}" do |dir|
      options[:working_dir] = dir
    end

    opts.on "--report-name REPORT_NAME_OPTION", "Set report name option. Default to :test_name" do |report_name_option|
      options[:report_name] = report_name_option
    end
  end

end

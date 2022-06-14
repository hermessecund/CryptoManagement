require "rake/testtask"

task default: %w[install]
task test: %w[UnitTestsPortFolioTest]

desc "Install all dependencies"
task :install do
	exec "bundle install"
end

Rake::TestTask.new do |t|
	t.name = "UnitTestsPortFolioTest"
	t.test_files = FileList['test/PortFolioTest.rb']
end
require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "oa-mailru"
    gem.summary = %Q{OmniAuth extension for mail.ru authentication}
    gem.description = %Q{OmniAuth extension for mail.ru authentication}
    gem.email = "alexander.gorkunov@gmail.com"
    gem.homepage = "http://github.com/gorkunov/oa-mailru"
    gem.authors = ["Alexander Gorkunov"]
    gem.rubyforge_project = "oa-mailru"
    gem.add_dependency 'oa-core', '~>0.1.4'
    gem.add_development_dependency "yard", ">= 0"
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "yardoc"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end

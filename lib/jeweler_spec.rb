begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "passenger-jmazzi"
    gemspec.summary = "Passenger with backtraces removed"
    gemspec.description = "Passenger with backtraces removed"
    gemspec.email = "incoming1@mailheist.com"
    gemspec.homepage = "http://github.com/jmazzi/passenger"
    gemspec.authors = ["Phusion - http://www.phusion.nl/", "Justin Mazzi"]
    gemspec.platform = Gem::Platform::RUBY
    gemspec.requirements << "fastthread" << "Apache 2 with development headers"
    gemspec.require_paths = ["lib", "ext"]
    gemspec.add_dependency 'rake', '>= 0.8.1'
    gemspec.add_dependency 'fastthread', '>= 1.0.1'
    gemspec.add_dependency 'rack'
    gemspec.extensions << 'ext/phusion_passenger/extconf.rb'
    gemspec.files = FileList[
      'Rakefile',
      'README',
      'DEVELOPERgemspec.TXT',
      'LICENSE',
      'INSTALL',
      'NEWS',
      'lib/**/*.rb',
      'lib/**/*.py',
      'lib/phusion_passenger/templates/*',
      'lib/phusion_passenger/templates/apache2/*',
      'lib/phusion_passenger/templates/nginx/*',
      'bin/*',
      'doc/*',

      # If you're running 'rake package' for the first time, then these
      # files don't exist yet, and so won't be matched by the above glob.
      # So we add these filenames manually.
      'doc/Users guide Apache.html',
      'doc/Users guide Nginx.html',
      'doc/Security of user switching support.html',

      'doc/*/*',
      'doc/*/*/*',
      'doc/*/*/*/*',
      'doc/*/*/*/*/*',
      'doc/*/*/*/*/*/*',
      'man/*',
      'debian/*',
      'ext/common/*.{cpp,c,h,hpp}',
      'ext/apache2/*.{cpp,h,c,TXT}',
      'ext/nginx/*.{c,cpp,h}',
      'ext/nginx/config',
      'ext/boost/*.{hpp,TXT}',
      'ext/boost/**/*.{hpp,cpp,pl,inl,ipp}',
      'ext/oxt/*.hpp',
      'ext/oxt/*.cpp',
      'ext/oxt/detail/*.hpp',
      'ext/phusion_passenger/*.{c,rb}',
      'benchmark/*.{cpp,rb}',
      'misc/*',
      'misc/*/*',
      'test/*.{rb,cpp,example}',
      'test/support/*.{cpp,h,rb}',
      'test/oxt/*.cpp',
      'test/ruby/**/*',
      'test/integration_tests/**/*',
      'test/stub/**/*'
    ]
    gemspec.executables = [
      'passenger-spawn-server',
      'passenger-install-apache2-module',
      'passenger-install-nginx-module',
      'passenger-config',
      'passenger-memory-stats',
      'passenger-make-enterprisey',
      'passenger-status',
      'passenger-stress-test'
    ]
    gemspec.has_rdoc = true
    gemspec.extra_rdoc_files = ['README']
    gemspec.rdoc_options <<
      "-S" << "-N" << "-p" << "-H" <<
      '--main' << 'README' <<
      '--title' << 'Passenger Ruby API'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

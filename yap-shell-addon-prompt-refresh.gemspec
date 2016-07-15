require File.dirname(__FILE__) + '/lib/yap-shell-addon-prompt-refresh/version'

Gem::Specification.new do |spec|
  spec.name    = 'yap-shell-addon-prompt-refresh'
  spec.version = YapShellAddonPromptRefresh::VERSION
  spec.authors  = ['Your name']
  spec.email    = 'you@example.com'
  spec.date    = Date.today.to_s

  spec.summary = 'prompt-refresh summary goes here.'
  spec.description = 'prompt-refresh description goes here.'
  spec.homepage = ''
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test\/|spec\/|features\/|.*\.gif$)/)
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "yap-shell", "~> 0.7"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "rspec", "~> 3.5"
end

Gem::Specification.new do |s|
  s.name = "fancy"
  s.version = "0.3.2"

  s.authors = ["Christopher Bertels"]
  s.date = "2011-03-08"
  s.email = "chris@fancy-lang.org"

  files =
    ["README.md", "LICENSE", "AUTHORS", "Rakefile", "boot/extconf.rb", "ruby_lib/fancy.rb"] +
    Dir.glob("lib/**/*.fy") + Dir.glob("lib/parser/ext/**/*") +
    Dir.glob("tests/**/*.fy") + ["tools/fancy-mode.el"] + ["bin/fancy", "bin/fdoc", "bin/fyi", "bin/ifancy"] +
    Dir.glob("examples/**/*.fy") + Dir.glob("doc/**/*")

  files = files.reject{ |f| f =~ /\.(fyc|rbc|o|log|plist)/ }.reject{ |f| f =~ /conftest\.dSYM/ }
  files += Dir.glob("boot/**/*").reject{ |f| f =~ /conftest\.dSYM/ }.reject{ |f| f =~ /\.(fyc|rbc|o|log|plist)/ }

  s.files = files
  s.require_path = "ruby_lib"
  s.extensions = 'boot/extconf.rb'

  s.executables = ["fancy", "ifancy", "fdoc", "fyi"]

  s.license = "BSD"

  s.has_rdoc = false
  s.homepage = "http://www.fancy-lang.org"
  s.rubyforge_project = "fancy"
  s.summary = "The Fancy Programming Language"

  s.description = <<EOS
The Fancy Programming Language

Fancy is a fully self-hosted, dynamic, pure class-based
object-oriented programming language heavily inspired by Smalltalk,
Ruby and Erlang. It supports dynamic code evaluation (as in Ruby &
Smalltalk), class-based mixins, generic pattern matching, runtime
introspection & reflection, "monkey patching" and much more. It runs
on Rubinius, the Ruby VM, and thus has first-class integration with
Ruby's core library and any additional Ruby libraries that run on
Rubinius, including most C-extensions.
EOS
end

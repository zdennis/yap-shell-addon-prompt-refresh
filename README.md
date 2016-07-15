# prompt-refresh for yap-shell

prompt-refresh is a yap-shell addon that automatically refreshes your prompt.

By default, it will refresh it every 100 milliseconds, but this is configurable thru your `yaprc` file.

![Prompt live refreshes across shell instances](/yap-shell-addon-prompt-refresh.gif?raw=true)

## Installation

Within the yap-shell you can install it as an addon via:

    $ yap addon install prompt-refresh

And then execute:

    $ reload!

Or install it yourself as:

    $ gem install yap-shell-addon-prompt-refresh

## Usage

If you have customized your yap-shell prompt to be a lambda/proc then it is possible to have yap automatically refresh it.

For example, say you put your current git branch into your prompt and you wanted every shell session you had open to always have the up-to-date branch displayed (without you having to do a thing).

You might have your prompt configured like this in your `~/.yap/yaprc` file:

    world.prompt = -> do
      # use ~ instead of full-path to home directory
      pwd = Dir.pwd.sub Regexp.new(ENV['HOME']), '~'

      # identify our current branch
      git_current_branch = `git branch 2>/dev/null | sed -n '/\* /s///p'`.chomp

      # is the current directory a part of a git enabled directory structure?
      is_git_aware = git_current_branch.length > 0

      git_branch = is_git_aware ? cyan(git_current_branch) : ''

      # E.g. ~/source/my-project master $
      "#{yellow(pwd)} #{git_branch} $ "
    end

After install this add-on your prompt will automatically refresh with the latest prompt every 100 milliseconds.

To change this you can configure this through your addon:

  world.addons[:'prompt-refresh'].refresh_interval_in_ms = 150


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zdennis/yap-shell-addon-prompt-refresh.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

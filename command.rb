require 'colorize'

module Command
  extend self

  def print(command)
    execute line(command)
  end

  def run(command)
    execute command
  end

  def clear
    execute 'clear'
  end

  private

  def execute(command)
    output = %Q(echo "#{command}" > test)
    %x(#{output})
  end

  def line(command)
    "echo \\\"#{prompt << sanitize_command(command)}\\\""
  end

  def sanitize_command(command)
    command.dump.dump
  end

  def prompt
    path.yellow << "$ "
  end

  def path
    "~/#{File.basename(%x(pwd)).chomp}"
  end

end

Command.clear
Command.print('pwd')
gets
Command.run('pwd')

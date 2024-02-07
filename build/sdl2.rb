def win_build

end

def unix_build
end

# First, determine if we're on the Windows runner. We have to build differently
# for Windows.
if ENV['RUNNER_OS'] == 'Windows'
  # Windows
  puts "Building SDL2 for Windows"

  win_build
else
  # Mac or Linux
  puts "Building SDL2 for #{ENV['RUNNER_OS']}"

  unix_build
end

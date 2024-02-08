def build_fna3d(arch)
  puts "Configuring FNA3D..."

  Dir.chdir('FNA3D') do
    if ENV['RUNNER_OS'] == "Windows"
      system 'cmake', '-B', 'release', '-G', 'Visual Studio 17 2022', '.', '-DCMAKE_BUILD_TYPE=Release', "-A #{arch}"
    elsif ENV['RUNNER_OS'] == "macOS"
      system 'cmmake', '-B', 'release', '-G', 'Xcode', '.', '-DCMAKE_BUILD_TYPE=Release', '-DCMAKE_OSX_ARCHITECTURES="x86_64;arm64"'
    else
      system 'cmake', '-B', 'release', '-G', 'Unix Makefiles', '.', '-DCMAKE_BUILD_TYPE=Release'
    end
  end

  puts "Building FNA3D..."

  if ENV['RUNNER_OS'] == "Windows"
    system 'cmake', '--build', 'release', '--config', 'Release'
  elsif ENV['RUNNER_OS'] == "macOS"
    system 'cmake', '--build', 'release', '--config', 'Release'
  else
    Dir.chdir('FNA3D/release') do
      system 'make'
    end
  end
end

if __FILE__ == $0
  arch = ARGV[0]

  if arch == nil
    puts "Usage: ruby fna3d.rb <architecture>"
    exit 1
  end

  build_fna3d(arch)
end

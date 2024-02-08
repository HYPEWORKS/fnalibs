def build_fna3d(arch)
  puts "Configuring FNA3D..."

  Dir.chdir('FNA3D') do
    if ENV['RUNNER_OS'] == "Windows"
      puts "Configuring for Windows (#{arch})..."
      system 'cmake', '-B', 'release', '-G', 'Visual Studio 17 2022', '.', '-DCMAKE_BUILD_TYPE=Release', "-A #{arch}", '-DCMAKE_POLICY_DEFAULT_CMP0074=NEW'
    elsif ENV['RUNNER_OS'] == "macOS"
      puts "Configuring for macOS (x86_64 and arm64)..."
      system 'cmmake', '-B', 'release', '-G', 'Xcode', '.', '-DCMAKE_BUILD_TYPE=Release', '-DCMAKE_OSX_ARCHITECTURES="x86_64;arm64"', '-DCMAKE_POLICY_DEFAULT_CMP0074=NEW'
    else
      puts "Configuring for Linux (#{arch})..."
      system 'cmake', '-B', 'release', '-G', 'Unix Makefiles', '.', '-DCMAKE_BUILD_TYPE=Release', '-DCMAKE_POLICY_DEFAULT_CMP0074=NEW'
    end

    system 'ls', '-la'
  end

  puts "Building FNA3D..."

  Dir.chdir('FNA3D') do
    if ENV['RUNNER_OS'] == "Windows"
      system 'cmake', '--build', '.', '--config', 'Release'
    elsif ENV['RUNNER_OS'] == "macOS"
      system 'cmake', '--build', '.', '--config', 'Release'
    else
      Dir.chdir('release') do
        system 'make'
      end
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

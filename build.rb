require_relative  'build/fna3d'

# Build FNA3D
if ENV['RUNNER_OS'] == "Windows"
  build_fna3d('x64')
  build_fna3d('Win32')
elsif ENV['RUNNER_OS'] == "macOS"
  build_fna3d('lol') # We don't need to specify an architecture, since we'll always build for Intel and Apple Silicon
else
  build_fna3d('x86_64')
end

require 'git'

# Clone SDL2
print "Cloning SDL2..."
Git.clone('https://github.com/libsdl-org/SDL.git', 'SDL2', :branch => 'SDL2')
print "\n"

# Clone FNA3D recursively
print "Cloning FNA3D..."
Git.clone('https://github.com/FNA-XNA/FNA3D.git', 'FNA3D', :recursive => true)
print "\n"

# Clone FAudio
print "Cloning FAudio..."
Git.clone('https://github.com/FNA-XNA/FAudio.git', 'FAudio')
print "\n"

# Clone Theorafile
print "Cloning Theorafile..."
Git.clone('https://github.com/FNA-XNA/Theorafile.git', 'Theorafile')
print "\n"

# Clone MoltenVK (for macOS)
if ENV['RUNNER_OS'] == 'macOS'
  print "Cloning MoltenVK..."
  # recursive clone
  Git.clone('https://github.com/KhronosGroup/MoltenVK', 'MoltenVK', :recursive => true)
  print "\n"
end

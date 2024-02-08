require 'git'

# Clone FNA3D
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
  Git.clone('https://github.com/KhronosGroup/MoltenVK', 'MoltenVK', :recursive => true)
  print "\n"
end

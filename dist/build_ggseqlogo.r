setwd('~/Development/ggseqlogo/')
require(devtools)
remove.packages('ggseqlogo')

targz = 'ggseqlogo_0.0.1.tar.gz'
system(sprintf('rm -rf dist/%s', targz))

# Regenerate Rwd files
document('./')

R_PATH = '/usr/local/bin/R'

# Build 
system(sprintf('%s CMD BUILD ./', R_PATH))

# Move into dist directory
system(sprintf('mv %s ./dist/%s', targz, targz))

# Install 
system(sprintf('%s CMD INSTALL dist/%s', R_PATH, targz))

#detach("package:gitter", unload=TRUE)
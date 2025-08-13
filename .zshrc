# Accelerate
export DYLD_LIBRARY_PATH="/usr/local/lib:$DYLD_LIBRARY_PATH"

# 2023-05-26 increases open file limit
ulimit -n 4096

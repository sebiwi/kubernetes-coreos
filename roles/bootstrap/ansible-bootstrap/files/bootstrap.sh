#/bin/bash

PYPY_DIR=$1
PYTHON_BINARY_PATH=$2

set -e

mkdir -p $(dirname $PYTHON_BINARY_PATH)

cat > $PYTHON_BINARY_PATH <<EOF
#!/bin/bash
LD_LIBRARY_PATH=$PYPY_DIR/lib:$LD_LIBRARY_PATH exec $PYPY_DIR/bin/pypy "\$@"
EOF

chmod +x $PYTHON_BINARY_PATH

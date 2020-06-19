#!/bin/bash

source ./.tmpl.variables

eval "cat <<EOF
$(< .README.md.tmpl)
EOF
" > README.md

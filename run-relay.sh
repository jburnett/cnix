#!/usr/bin/bash

let "errs=0"

if [ ! -d "$cardano_base" ]; then
  echo "ERROR: \$cardano_base $cardano_base not found"
  let "errs |= 1"
fi

if [ ! -d "$cardano_config_path" ]; then
  echo "ERROR: \$cardano_config_path $cardano_config_path not found"
  let "errs |= 2"
fi

# if [ 0 != $errs ]; then
#   exit $errs
# fi

cmd="cardano-node run \
    --topology $cardano_config_path/$relay_topo \
    --database-path $cardano_base/db \
    --socket-path $cardano_base/db/cardano-node.socket \
    --host-addr 0.0.0.0 \
    --port 13201\
    --config $cardano_config_path/$config"
echo $cmd


with import <nixpkgs> {};

mkShell {
  buildInputs = [
    gawk
    gnugrep
  ];

  shellHook = ''
    host=$(hostname)
    network=testnet

    export cardano_base=/mnt/amtnas/bcdata/cardano/$host/$network
    export cardano_config_path=$cardano_base/config

    export testnet_magic=1097911063
    export relay_topo=$network-relay-topology.json
    export producer_topo=$network-producer-topology.json
    export alonzo=$network-alonzo-genesis.json
    export byron=$network-byron-genesis.json
    export shelley=$network-shelley-genesis.json

    alias cardano-node=/home/cardano/$network-node-local/bin/cardano-node-$network

    echo "\$cardano_base: $cardano_base"
    echo "\$cardano_config_path: $cardano_config_path"

    if [ ! -d $cardano_config_path ]; then
      echo "$cardano_config_path not found"
      exit 1
    fi
    
  '';
}

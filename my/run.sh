#!/bin/env sh

FSM=calib_ctrl
FSM=AFE_inf
FSM=BG_calib
FSM=config_ctrl
FSM=equation_mem
FSM=mbist
FSM=operation_ctrl
FSM=sys_ctrl
../fsm2sv  -i ${FSM}.yml -o ${FSM}.sv -d ${FSM}.dot -t sv tb_${FSM}.sv

echo "== work with Graphviz dot command"
dot   -Tpng ${FSM}.dot -o ${FSM}.png
mv ${FSM}.png /mnt/d/

./dot2mmd.sh ${FSM}.dot ${FSM}.mmd ${FSM}
docker run --rm -u `id -u`:`id -g` -v .:/data minlag/mermaid-cli -i ${FSM}.mmd -o ${FSM}.mmd.png
mv ${FSM}.mmd.png /mnt/d/


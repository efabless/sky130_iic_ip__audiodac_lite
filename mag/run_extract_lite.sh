#! /bin/bash

project=sky130_iic_ip__audiodac_drv_lite

echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=sky130A} > /dev/null

magic -dnull -noconsole -rcfile \$PDK_ROOT/\$PDK/libs.tech/magic/sky130A.magicrc << EOF
load ${project}
select top cell
extract path extfiles
extract all
ext2spice lvs
ext2spice -p extfiles -o ../netlist/layout/${project}.spice
quit -noprompt
EOF
rm -r extfiles
exit 0


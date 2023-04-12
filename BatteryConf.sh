#!/bin/bash
if [[ $# -ne 0 ]]; then
	sudo /opt/dell/dcc/cctk --PrimaryBattChargeCfg
	if [[ $1 == "d" ]]; then
		sudo /opt/dell/dcc/cctk --PrimaryBattChargeCfg=Custom:65-80
	elif [[ $1 == "s" ]]; then
		sudo /opt/dell/dcc/cctk --PrimaryBattChargeCfg=Standard
	elif [[ $1 == "c" ]]; then
		if [[ $# -ne 3 ]]; then
			echo "Wrong parameters!"
			exit
		else
			sudo /opt/dell/dcc/cctk --PrimaryBattChargeCfg=Custom:$2-$3
		fi
	fi
	exit
fi
		
echo -e "Your current state is " 
sudo /opt/dell/dcc/cctk --PrimaryBattChargeCfg
echo "Do you want to change the mode?(Y/N): "
read ans
if [[ $ans != "Y" ]]; then
	exit
fi

echo "Enter the mode you want(Standard/Custom): "
read mode
echo $mode
if [[ $mode == "Standard" ]]; then
	sudo /opt/dell/dcc/cctk --PrimaryBattChargeCfg=Standard
elif [[ $mode == "Custom" ]]; then
	echo "Enter range(50-80):"
	read range
	sudo /opt/dell/dcc/cctk --PrimaryBattChargeCfg=Custom:$range
else
	echo "Wrong!!"
fi


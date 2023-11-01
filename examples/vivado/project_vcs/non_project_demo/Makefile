HOSTNAME ?= $(shell  hostname)

all : 
	echo "HOSTNAME is $(HOSTNAME)"
ifeq "$(HOSTNAME)" "L2876" 
	echo "L2876 : no need to source settings"
else
	echo "Other hosts need settings.sh"
	#[[ $$(hostname) -eq "NoSuchHost" ]] && . /opt/Xilinx/Vivado/2020.2/settings64.sh 
endif
	vivado -mode batch -source ./vivado_non_project.tcl -notrace -tclargs -cmd run -ifn ./file_list_led.txt -top led_top -part xc7s15ftgb196-1

git.sh : 
	. /opt/Xilinx/Vivado/2020.2/settings64.sh 
	vivado -mode batch -source ./vivado_non_project.tcl -notrace -tclargs -cmd vcs -ifn ./file_list_led.txt -top led_top -part xc7s15ftgb196-1 -out  git.sh

clean :
	git clean -f -x

all : 
	. /opt/Xilinx/Vivado/2020.2/settings64.sh 
	vivado -mode batch -source ./vivado_non_project.tcl -notrace -tclargs -cmd run -ifn ./file_list_led.txt -top led_top -part xc7s15ftgb196-1

git.sh : 
	. /opt/Xilinx/Vivado/2020.2/settings64.sh 
	vivado -mode batch -source ./vivado_non_project.tcl -notrace -tclargs -cmd vcs -ifn ./file_list_led.txt -top led_top -part xc7s15ftgb196-1 -out  git.sh

clean :
	git clean -f -x

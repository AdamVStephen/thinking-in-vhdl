all : 
	source /opt/Xilinx/Vivado/2020.2/settings64.sh 
	vivado -mode batch -source ./vivado_non_project.tcl -notrace -tclargs -cmd run -ifn ./file_list_led.txt -top led_top -part xc7s15ftgb196-1

clean :
	git clean -f -x


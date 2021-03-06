EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:regulators
LIBS:ESP8266
LIBS:BatteryESP8266Node-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_01x02 J1
U 1 1 5A00BB34
P 1300 2400
F 0 "J1" H 1300 2500 50  0000 C CNN
F 1 "Power" H 1300 2200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1300 2400 50  0001 C CNN
F 3 "" H 1300 2400 50  0001 C CNN
	1    1300 2400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 5A00BDDD
P 1600 2500
F 0 "#PWR01" H 1600 2250 50  0001 C CNN
F 1 "GND" H 1600 2350 50  0000 C CNN
F 2 "" H 1600 2500 50  0001 C CNN
F 3 "" H 1600 2500 50  0001 C CNN
	1    1600 2500
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5A020B9A
P 7500 5150
F 0 "R4" V 7580 5150 50  0000 C CNN
F 1 "10K" V 7500 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 7430 5150 50  0001 C CNN
F 3 "" H 7500 5150 50  0001 C CNN
	1    7500 5150
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5A020DDF
P 8400 5150
F 0 "R5" V 8480 5150 50  0000 C CNN
F 1 "10K" V 8400 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 8330 5150 50  0001 C CNN
F 3 "" H 8400 5150 50  0001 C CNN
	1    8400 5150
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5A020E40
P 9600 5150
F 0 "R6" V 9680 5150 50  0000 C CNN
F 1 "10K" V 9600 5150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9530 5150 50  0001 C CNN
F 3 "" H 9600 5150 50  0001 C CNN
	1    9600 5150
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW1
U 1 1 5A020E93
P 8400 5600
F 0 "SW1" H 8450 5700 50  0000 L CNN
F 1 "Reset" H 8400 5540 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_KMR2" H 8400 5800 50  0001 C CNN
F 3 "" H 8400 5800 50  0001 C CNN
	1    8400 5600
	0    1    1    0   
$EndComp
$Comp
L SW_Push SW2
U 1 1 5A020F70
P 9600 5600
F 0 "SW2" H 9650 5700 50  0000 L CNN
F 1 "Flash" H 9600 5540 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_KMR2" H 9600 5800 50  0001 C CNN
F 3 "" H 9600 5800 50  0001 C CNN
	1    9600 5600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 5A0210F9
P 8400 5900
F 0 "#PWR02" H 8400 5650 50  0001 C CNN
F 1 "GND" H 8400 5750 50  0000 C CNN
F 2 "" H 8400 5900 50  0001 C CNN
F 3 "" H 8400 5900 50  0001 C CNN
	1    8400 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5A02111F
P 9600 5900
F 0 "#PWR03" H 9600 5650 50  0001 C CNN
F 1 "GND" H 9600 5750 50  0000 C CNN
F 2 "" H 9600 5900 50  0001 C CNN
F 3 "" H 9600 5900 50  0001 C CNN
	1    9600 5900
	1    0    0    -1  
$EndComp
Text Label 9700 5350 0    60   ~ 0
ESP_FLASH
Text Label 8500 5350 0    60   ~ 0
ESP_RESET
Text Label 7500 5400 3    60   ~ 0
ESP_CH_PD
Text Label 2600 5950 2    60   ~ 0
ESP_CH_PD
Text Label 2600 5750 2    60   ~ 0
ESP_RESET
Text Label 4600 6150 0    60   ~ 0
ESP_FLASH
$Comp
L GND #PWR04
U 1 1 5A021A9B
P 4600 6550
F 0 "#PWR04" H 4600 6300 50  0001 C CNN
F 1 "GND" H 4600 6400 50  0000 C CNN
F 2 "" H 4600 6550 50  0001 C CNN
F 3 "" H 4600 6550 50  0001 C CNN
	1    4600 6550
	1    0    0    -1  
$EndComp
Text Label 4600 5750 0    60   ~ 0
ESP_UART_TX
Text Label 4600 5850 0    60   ~ 0
ESP_UART_RX
$Comp
L R R2
U 1 1 5A0221F2
P 2600 1850
F 0 "R2" V 2680 1850 50  0000 C CNN
F 1 "10K" V 2600 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2530 1850 50  0001 C CNN
F 3 "" H 2600 1850 50  0001 C CNN
	1    2600 1850
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A0222B9
P 2600 2250
F 0 "R3" V 2680 2250 50  0000 C CNN
F 1 "10K" V 2600 2250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2530 2250 50  0001 C CNN
F 3 "" H 2600 2250 50  0001 C CNN
	1    2600 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5A022334
P 2600 2500
F 0 "#PWR05" H 2600 2250 50  0001 C CNN
F 1 "GND" H 2600 2350 50  0000 C CNN
F 2 "" H 2600 2500 50  0001 C CNN
F 3 "" H 2600 2500 50  0001 C CNN
	1    2600 2500
	1    0    0    -1  
$EndComp
Text Label 2800 2050 0    60   ~ 0
VBAT_SENSE
Text Label 2600 5850 2    60   ~ 0
VBAT_SENSE
$Comp
L D D1
U 1 1 5A022728
P 1600 1850
F 0 "D1" H 1600 1950 50  0000 C CNN
F 1 "D" H 1600 1750 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 1600 1850 50  0001 C CNN
F 3 "" H 1600 1850 50  0001 C CNN
	1    1600 1850
	0    1    1    0   
$EndComp
$Comp
L +BATT #PWR06
U 1 1 5A02288A
P 1600 1200
F 0 "#PWR06" H 1600 1050 50  0001 C CNN
F 1 "+BATT" H 1600 1340 50  0000 C CNN
F 2 "" H 1600 1200 50  0001 C CNN
F 3 "" H 1600 1200 50  0001 C CNN
	1    1600 1200
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR07
U 1 1 5A0228BC
P 2600 1200
F 0 "#PWR07" H 2600 1050 50  0001 C CNN
F 1 "+BATT" H 2600 1340 50  0000 C CNN
F 2 "" H 2600 1200 50  0001 C CNN
F 3 "" H 2600 1200 50  0001 C CNN
	1    2600 1200
	1    0    0    -1  
$EndComp
Text Label 4600 5950 0    60   ~ 0
IO_5
Text Label 4600 6050 0    60   ~ 0
IO_4
Text Label 4600 6250 0    60   ~ 0
IO_2
Text Label 4600 6350 0    60   ~ 0
IO_15
Text Label 2600 6050 2    60   ~ 0
IO_16
Text Label 2600 6150 2    60   ~ 0
IO_14
Text Label 2600 6250 2    60   ~ 0
IO_12
Text Label 2600 6350 2    60   ~ 0
IO_13
Text Label 4500 4600 0    60   ~ 0
IO_5
Text Label 4500 4400 0    60   ~ 0
IO_2
Text Label 4500 4500 0    60   ~ 0
IO_4
Text Label 4500 4200 0    60   ~ 0
IO_12
Text Label 4500 4100 0    60   ~ 0
IO_13
Text Label 4500 4700 0    60   ~ 0
IO_14
Text Label 4500 4300 0    60   ~ 0
IO_15
Text Label 4500 4800 0    60   ~ 0
IO_16
Text Label 1900 4300 2    60   ~ 0
ESP_UART_TX
Text Label 1900 4400 2    60   ~ 0
ESP_UART_RX
$Comp
L R R1
U 1 1 5A084EF5
P 2600 1450
F 0 "R1" V 2680 1450 50  0000 C CNN
F 1 "10K" V 2600 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2530 1450 50  0001 C CNN
F 3 "" H 2600 1450 50  0001 C CNN
	1    2600 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2400 1600 2400
Wire Wire Line
	8400 4900 8400 5000
Wire Wire Line
	8400 5300 8400 5400
Wire Wire Line
	8400 5800 8400 5900
Wire Wire Line
	9600 5900 9600 5800
Wire Wire Line
	9600 5300 9600 5400
Wire Wire Line
	9600 5000 9600 4900
Wire Wire Line
	9700 5350 9600 5350
Connection ~ 9600 5350
Wire Wire Line
	8500 5350 8400 5350
Connection ~ 8400 5350
Wire Wire Line
	7500 4900 7500 5000
Wire Wire Line
	7500 5300 7500 5400
Wire Wire Line
	2600 5750 2700 5750
Wire Wire Line
	2700 5950 2600 5950
Wire Wire Line
	4600 6150 4500 6150
Wire Wire Line
	4500 5750 4600 5750
Wire Wire Line
	4500 5850 4600 5850
Wire Wire Line
	1500 2300 1600 2300
Wire Wire Line
	1600 2400 1600 2500
Wire Wire Line
	2600 2000 2600 2100
Wire Wire Line
	2600 2400 2600 2500
Wire Wire Line
	2800 2050 2600 2050
Connection ~ 2600 2050
Wire Wire Line
	2700 5850 2600 5850
Wire Wire Line
	1600 2300 1600 2000
Wire Wire Line
	2600 6050 2700 6050
Wire Wire Line
	2600 6150 2700 6150
Wire Wire Line
	2600 6250 2700 6250
Wire Wire Line
	2600 6350 2700 6350
Wire Wire Line
	4500 5950 4600 5950
Wire Wire Line
	4500 6050 4600 6050
Wire Wire Line
	4500 6250 4600 6250
Wire Wire Line
	4600 6350 4500 6350
Wire Wire Line
	2600 1200 2600 1300
Wire Wire Line
	2600 1600 2600 1700
Wire Wire Line
	1600 1200 1600 1700
$Comp
L ESP-12E U1
U 1 1 5A087796
P 3600 6050
F 0 "U1" H 3600 5950 50  0000 C CNN
F 1 "ESP-12E" H 3600 6150 50  0000 C CNN
F 2 "ESP8266:ESP-12E_SMD" H 3600 6050 50  0001 C CNN
F 3 "" H 3600 6050 50  0001 C CNN
	1    3600 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6450 2600 6450
Wire Wire Line
	2600 6450 2600 6550
Wire Wire Line
	4500 6450 4600 6450
Wire Wire Line
	4600 6450 4600 6550
$Comp
L AP2112K-3.3 U2
U 1 1 5A088A06
P 5300 1800
F 0 "U2" H 5100 2025 50  0000 L CNN
F 1 "AP2112K-3.3" H 5300 2025 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 5300 2125 50  0001 C CNN
F 3 "" H 5300 1900 50  0001 C CNN
	1    5300 1800
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5A088E04
P 4750 1800
F 0 "R7" V 4830 1800 50  0000 C CNN
F 1 "1K" V 4750 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4680 1800 50  0001 C CNN
F 3 "" H 4750 1800 50  0001 C CNN
	1    4750 1800
	0    1    1    0   
$EndComp
$Comp
L +BATT #PWR08
U 1 1 5A088F67
P 4400 1600
F 0 "#PWR08" H 4400 1450 50  0001 C CNN
F 1 "+BATT" H 4400 1740 50  0000 C CNN
F 2 "" H 4400 1600 50  0001 C CNN
F 3 "" H 4400 1600 50  0001 C CNN
	1    4400 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1800 4900 1800
$Comp
L GND #PWR09
U 1 1 5A08909D
P 5300 2300
F 0 "#PWR09" H 5300 2050 50  0001 C CNN
F 1 "GND" H 5300 2150 50  0000 C CNN
F 2 "" H 5300 2300 50  0001 C CNN
F 3 "" H 5300 2300 50  0001 C CNN
	1    5300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2100 5300 2300
$Comp
L C C1
U 1 1 5A09FFDB
P 4400 2050
F 0 "C1" H 4425 2150 50  0000 L CNN
F 1 "C" H 4425 1950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4438 1900 50  0001 C CNN
F 3 "" H 4400 2050 50  0001 C CNN
	1    4400 2050
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5A0A0088
P 6000 2050
F 0 "C2" H 6025 2150 50  0000 L CNN
F 1 "C" H 6025 1950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6038 1900 50  0001 C CNN
F 3 "" H 6000 2050 50  0001 C CNN
	1    6000 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2200 6000 2200
Connection ~ 5300 2200
Wire Wire Line
	4400 1600 4400 1900
Wire Wire Line
	4600 1800 4400 1800
Connection ~ 4400 1800
Wire Wire Line
	5000 1700 4400 1700
Connection ~ 4400 1700
Wire Wire Line
	5600 1700 6000 1700
Wire Wire Line
	6000 1600 6000 1900
Connection ~ 6000 1700
$Comp
L +3.3V #PWR010
U 1 1 5A0A133A
P 6000 1600
F 0 "#PWR010" H 6000 1450 50  0001 C CNN
F 1 "+3.3V" H 6000 1740 50  0000 C CNN
F 2 "" H 6000 1600 50  0001 C CNN
F 3 "" H 6000 1600 50  0001 C CNN
	1    6000 1600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR011
U 1 1 5A0A174D
P 2600 6550
F 0 "#PWR011" H 2600 6400 50  0001 C CNN
F 1 "+3.3V" H 2600 6690 50  0000 C CNN
F 2 "" H 2600 6550 50  0001 C CNN
F 3 "" H 2600 6550 50  0001 C CNN
	1    2600 6550
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR012
U 1 1 5A0A183B
P 9600 4900
F 0 "#PWR012" H 9600 4750 50  0001 C CNN
F 1 "+3.3V" H 9600 5040 50  0000 C CNN
F 2 "" H 9600 4900 50  0001 C CNN
F 3 "" H 9600 4900 50  0001 C CNN
	1    9600 4900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 5A0A18B5
P 7500 4900
F 0 "#PWR013" H 7500 4750 50  0001 C CNN
F 1 "+3.3V" H 7500 5040 50  0000 C CNN
F 2 "" H 7500 4900 50  0001 C CNN
F 3 "" H 7500 4900 50  0001 C CNN
	1    7500 4900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 5A0A18F6
P 8400 4900
F 0 "#PWR014" H 8400 4750 50  0001 C CNN
F 1 "+3.3V" H 8400 5040 50  0000 C CNN
F 2 "" H 8400 4900 50  0001 C CNN
F 3 "" H 8400 4900 50  0001 C CNN
	1    8400 4900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR015
U 1 1 5A106DEF
P 2700 4200
F 0 "#PWR015" H 2700 4050 50  0001 C CNN
F 1 "+3.3V" H 2700 4340 50  0000 C CNN
F 2 "" H 2700 4200 50  0001 C CNN
F 3 "" H 2700 4200 50  0001 C CNN
	1    2700 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5A106E36
P 2700 4500
F 0 "#PWR016" H 2700 4250 50  0001 C CNN
F 1 "GND" H 2700 4350 50  0000 C CNN
F 2 "" H 2700 4500 50  0001 C CNN
F 3 "" H 2700 4500 50  0001 C CNN
	1    2700 4500
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x08 J3
U 1 1 5A107287
P 4100 4500
F 0 "J3" H 4100 4900 50  0000 C CNN
F 1 "IO" H 4100 4000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 4100 4500 50  0001 C CNN
F 3 "" H 4100 4500 50  0001 C CNN
	1    4100 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 4100 4500 4100
Wire Wire Line
	4500 4200 4300 4200
Wire Wire Line
	4300 4300 4500 4300
Wire Wire Line
	4500 4800 4300 4800
Wire Wire Line
	4300 4700 4500 4700
Wire Wire Line
	4500 4600 4300 4600
Wire Wire Line
	4300 4500 4500 4500
Wire Wire Line
	4300 4400 4500 4400
$Comp
L Conn_01x04 J4
U 1 1 5A10822F
P 7500 3400
F 0 "J4" H 7500 3600 50  0000 C CNN
F 1 "GND" H 7500 3100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 7500 3400 50  0001 C CNN
F 3 "" H 7500 3400 50  0001 C CNN
	1    7500 3400
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x04 J5
U 1 1 5A1083A8
P 8700 3400
F 0 "J5" H 8700 3600 50  0000 C CNN
F 1 "3V3" H 8700 3100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 8700 3400 50  0001 C CNN
F 3 "" H 8700 3400 50  0001 C CNN
	1    8700 3400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR017
U 1 1 5A108441
P 7800 3600
F 0 "#PWR017" H 7800 3350 50  0001 C CNN
F 1 "GND" H 7800 3450 50  0000 C CNN
F 2 "" H 7800 3600 50  0001 C CNN
F 3 "" H 7800 3600 50  0001 C CNN
	1    7800 3600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR018
U 1 1 5A10847B
P 9000 3100
F 0 "#PWR018" H 9000 2950 50  0001 C CNN
F 1 "+3.3V" H 9000 3240 50  0000 C CNN
F 2 "" H 9000 3100 50  0001 C CNN
F 3 "" H 9000 3100 50  0001 C CNN
	1    9000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3200 7800 3200
Wire Wire Line
	7800 3200 7800 3600
Wire Wire Line
	7700 3500 7800 3500
Connection ~ 7800 3500
Wire Wire Line
	7700 3400 7800 3400
Connection ~ 7800 3400
Wire Wire Line
	7700 3300 7800 3300
Connection ~ 7800 3300
Wire Wire Line
	9000 3100 9000 3500
Wire Wire Line
	9000 3500 8900 3500
Wire Wire Line
	8900 3400 9000 3400
Connection ~ 9000 3400
Wire Wire Line
	8900 3300 9000 3300
Connection ~ 9000 3300
Wire Wire Line
	8900 3200 9000 3200
Connection ~ 9000 3200
$Comp
L Conn_02x02_Counter_Clockwise J2
U 1 1 5A108D38
P 2400 4400
F 0 "J2" H 2450 4500 50  0000 C CNN
F 1 "UART" H 2450 4200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02_Pitch2.54mm" H 2400 4400 50  0001 C CNN
F 3 "" H 2400 4400 50  0001 C CNN
	1    2400 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 4400 2700 4400
Wire Wire Line
	2700 4400 2700 4500
Wire Wire Line
	2700 4200 2700 4300
Wire Wire Line
	2700 4300 2600 4300
Wire Wire Line
	2100 4300 1900 4300
Wire Wire Line
	1900 4400 2100 4400
$EndSCHEMATC

set moduleName poly
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName poly
set C_modelType { void 0 }
set C_modelArgList { 
	{ x int 32 regular  }
	{ y int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "rtlName" : "x","bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "x","cData": "int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "rtlName" : "y","bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "y","cData": "int","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 9
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x sc_in sc_lv 32 signal 0 } 
	{ y sc_out sc_lv 32 signal 1 } 
	{ y_ap_vld sc_out sc_logic 1 outvld 1 } 
}

set Spec2ImplPortList { 
	x { ap_none {  { x in_data 0 32 } } }
	y { ap_vld {  { y out_data 1 32 }  { y_ap_vld out_vld 1 1 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}

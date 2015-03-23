// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2013.4
// Copyright (C) 2013 Xilinx Inc. All rights reserved.
// 
// ==============================================================

 `timescale 1ns/1ps


`define AUTOTB_DUT      poly
`define AUTOTB_DUT_INST AESL_inst_poly
`define AUTOTB_TOP      apatb_poly_top
`define AUTOTB_LAT_RESULT_FILE "poly.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "poly.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_poly_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_TRANSACTION_NUM  1
`define AUTOTB_CLOCK_PERIOD 10.000000
`define LENGTH_x 1
`define LENGTH_y 1

`define   AESL_DEPTH_x 1
`define   AESL_DEPTH_y 1
`define AUTOTB_TVIN_x  "../tv/cdatafile/c.poly.autotvin_x.dat"
`define AUTOTB_TVIN_x_out_wrapc  "../tv/rtldatafile/rtl.poly.autotvin_x.dat"
`define AUTOTB_TVOUT_y  "../tv/cdatafile/c.poly.autotvout_y.dat"
`define AUTOTB_TVOUT_y_out_wrapc  "../tv/rtldatafile/rtl.poly.autotvout_y.dat"

module `AUTOTB_TOP;
task read_token;
    input integer fp;
    output reg [127 : 0] token;
    reg [7:0] c;
    reg intoken;
    reg done;
    begin
        token = "";
        intoken = 0;
        done = 0;
        while (!done) begin
            c = $fgetc(fp);
            if (c == 8'hff) begin   // EOF
                done = 1;
            end
            else if (c == " " || c == "\011" || c == "\012" || c == "\015") begin   // blank
                if (intoken) begin
                    done = 1;
                end
            end
            else begin              // valid character
                intoken = 1;
                token = (token << 8) | c;
            end
        end
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
reg [31 : 0] AESL_mLatCnterIn [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterIn_addr;
reg [31 : 0] AESL_mLatCnterOut [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterOut_addr ;
reg [31 : 0] AESL_clk_counter ;
wire ap_clk;
wire ap_rst;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [7 : 0] x;
wire [7 : 0] y;
wire  y_ap_vld;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

`AUTOTB_DUT `AUTOTB_DUT_INST(
.ap_clk(ap_clk),
.ap_rst(ap_rst),
.ap_start(ap_start),
.ap_done(ap_done),
.ap_idle(ap_idle),
.ap_ready(ap_ready),
.x(x),
.y(y),
.y_ap_vld(y_ap_vld)
);

// Assignment for control signal
  assign ap_clk = AESL_clock;
  assign ap_rst = AESL_reset;
  assign ap_rst_n = ~AESL_reset;
  assign AESL_reset = rst;
  assign ap_start = AESL_start;
  assign AESL_start = start;
  assign AESL_done = ap_done;
  assign AESL_idle = ap_idle;
  assign AESL_ready = ap_ready;
  assign AESL_ce = ce;
  assign AESL_continue = continue;
// The signal of port x
reg [7: 0] AESL_REG_x = 0;
assign x = AESL_REG_x;
initial begin : read_file_process_x
    integer fp;
    integer err;
    integer ret;
    integer rand;
    reg [127  : 0] token;
    integer i;
    reg transaction_finish;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_x,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_x);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin // Illegal format
        $display("Illegal format of \"[[[runtime]]]\" part in file \"%s\"!", `AUTOTB_TVIN_x);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("Illegal format of \"[[transaction]]\" part in file \"%s\"!", `AUTOTB_TVIN_x);
            $display("ERROR: Simulation using HLS TB failed.");
	          $finish;
        end
        read_token(fp, token);  // skip transaction number
	      read_token(fp, token);
            @(posedge AESL_clock);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_x);
	          if (ret != 1) begin
	              $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
	              $finish;
	          end
	          read_token(fp, token);
        end
	      read_token(fp, token);
    end
    $fclose(fp);
end

reg AESL_REG_y_ap_vld = 0;
// The signal of port y
reg [7: 0] AESL_REG_y = 0;
always @(posedge AESL_clock)
begin
    if(AESL_reset)
        AESL_REG_y = 0; 
    else if(y_ap_vld) begin
        AESL_REG_y <= y;
        AESL_REG_y_ap_vld <= 1;
    end
end 

initial begin : write_file_process_y
    integer fp;
    integer fp_size;
    integer err;
    integer ret;
    integer i;
    integer hls_stream_size;
    integer rand;
    integer y_count;
    reg [127  : 0] token;
    integer transaction_idx;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVOUT_y_out_wrapc,"w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_y_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    transaction_idx = 0;
    while (transaction_idx != `AUTOTB_TRANSACTION_NUM) begin
        $fdisplay(fp,"[[transaction]] %d", transaction_idx);
        @(posedge AESL_clock);
	      while(AESL_done !== 1) begin
	          @(posedge AESL_clock);
	      end
        # 0.4;
        if(AESL_REG_y_ap_vld)  begin
	      $fdisplay(fp,"0x%x", AESL_REG_y);
        AESL_REG_y_ap_vld = 0;
        end
    transaction_idx = transaction_idx + 1;
	  $fdisplay(fp,"[[/transaction]]");
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

initial begin : generate_ready_cnt_proc
    ready_cnt = 0;
    wait(AESL_reset === 0);
    while(ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        ready_cnt = ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

initial begin : generate_done_cnt_proc
    done_cnt = 0;
    wait(AESL_reset === 0);
    while(done_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_done !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        done_cnt = done_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
    @(posedge AESL_clock);
    # 0.4;
    $finish;
end

initial fork
    AESL_clock = 0;
    forever #(`AUTOTB_CLOCK_PERIOD/2) AESL_clock = ~AESL_clock;
join

initial begin : initial_process
    integer rand;
    rst = 1;
    # 100;
	  repeat(3) @(posedge AESL_clock);
    rst = 0;
end

initial begin : start_process
  integer rand;
  start = 0;
  ce = 1;
    wait(AESL_reset === 0);
  @(posedge AESL_clock);
  start <= 1;
  while(ready_cnt != `AUTOTB_TRANSACTION_NUM + 1) begin
      @(posedge AESL_clock);
      if(AESL_ready == 1) begin
          start <= 0;
          start <= 1;
      end
  end
  start <= 0;
end

always @(AESL_done)
begin
    continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == `AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt != `AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
    begin
        AESL_clk_counter <= 0;
    end 
    else begin
        AESL_clk_counter = AESL_clk_counter + 1;
    end    
end

always @ (posedge AESL_clock or posedge AESL_reset) begin
    if(AESL_reset)
    begin
        AESL_mLatCnterOut_addr = 0;
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter + 1;
    end
    else if (AESL_done && AESL_mLatCnterOut_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter;
        AESL_mLatCnterOut_addr = AESL_mLatCnterOut_addr + 1;
    end
end

always @ (posedge AESL_clock or posedge AESL_reset) begin
    if(AESL_reset)
    begin
        AESL_mLatCnterIn_addr = 0;
    end
    else begin
        if (AESL_start && AESL_mLatCnterIn_addr == 0) begin
            AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
            AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
        end
        if (AESL_ready && AESL_mLatCnterIn_addr < `AUTOTB_TRANSACTION_NUM + 1 ) begin
            AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
            AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
        end
    end
end

initial begin : performance_check
    integer transaction_counter;
    integer i;
    integer fp;

    integer latthistime;
    integer lattotal;
    integer latmax;
    integer latmin;


    integer thrthistime;
    integer thrtotal;
    integer thrmax;
    integer thrmin;

    integer lataver;
    integer thraver;
    reg [31 : 0] lat_array [0 : `AUTOTB_TRANSACTION_NUM];
    reg [31 : 0] thr_array [0 : `AUTOTB_TRANSACTION_NUM];

    i = 0;
    lattotal = 0;
    latmax = 0;
    latmin = 32'h 7fffffff;
    lataver = 0;

    thrtotal = 0;
    thrmax = 0;
    thrmin = 32'h 7fffffff;
    thraver = 0;

    
    @(negedge AESL_clock); 
    @(negedge AESL_reset); 
    while (done_cnt != `AUTOTB_TRANSACTION_NUM) begin
            @(posedge AESL_clock);
    end
    #0.001

    if (AESL_mLatCnterIn_addr == 1 || AESL_mLatCnterIn_addr == 0 ) begin
        latmax  = 0;
        latmin  = 0;
        lataver = 0;
        thrmax  = 0;
        thrmin  = 0;
        thraver = 0;
        lat_array[0] = 0;
        thr_array[0] = 0;
    end
    else if (AESL_mLatCnterOut_addr == 1 || AESL_mLatCnterOut_addr == 0 ) begin
        latmax  = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        latmin  = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        lataver = AESL_mLatCnterOut[0] - AESL_mLatCnterIn[0];
        thrmax  = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        thrmin  = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        thraver = AESL_mLatCnterIn[1] - AESL_mLatCnterIn[0] + 1;
        lat_array[0] = lataver;
        thr_array[0] = thraver;
    end
    else begin
//LATENCY
    for (i = 0;i < AESL_mLatCnterOut_addr ; i = i + 1) begin
        latthistime = AESL_mLatCnterOut[i] - AESL_mLatCnterIn[i] ;
        if ( i > 0 ) begin
            latthistime = (latthistime - 1 < 0) ? 0 : (latthistime - 1);
        end
        lattotal = lattotal + latthistime;
        lat_array[i] = latthistime;
        if (latthistime > latmax) latmax = latthistime;
        if (latthistime < latmin) latmin = latthistime;
    end
//II
    for (i = 0;i < AESL_mLatCnterIn_addr - 1; i = i + 1) begin
        thrthistime = AESL_mLatCnterIn[i + 1] - AESL_mLatCnterIn[i];
        if ( i == 0 ) begin
            thrthistime = thrthistime + 1;
        end
        thrtotal = thrtotal + thrthistime;
        thr_array[i] = thrthistime;
        if (thrthistime > thrmax) thrmax = thrthistime;
        if (thrthistime < thrmin) thrmin = thrthistime;
    end    
    
    thr_array[AESL_mLatCnterIn_addr - 1] = 0;
    lataver = lattotal / ( AESL_mLatCnterOut_addr);
    thraver = thrtotal / ( AESL_mLatCnterIn_addr - 1 );
    end

	fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");
    
	$fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latmax );
	$fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latmin );
	$fdisplay(fp, "$AVER_LATENCY = \"%0d\"", lataver );
	$fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", thrmax );
	$fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", thrmin );
	$fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", thraver );
	$fclose(fp);
	  fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");
    $fdisplay (fp,"%20s%16s%16s","","latency","interval");
    for (i = 0; i < AESL_mLatCnterOut_addr; i = i + 1) begin
        $fdisplay (fp,"transaction%8d:%16d%16d",i , lat_array[i], thr_array[i]);
    end

	$fclose(fp);
end
endmodule
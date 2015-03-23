

module top ();

   bit [15:0]  a;
   bit [15:0]  b;

  bit  start;


  poly  DUT(.ap_start(start),
            .ap_done(),
            .ap_idle(),
            .ap_ready(),
            .x(a),
            .y(b),
            .y_ap_vld()
           );


  initial begin
    start = 0;
    #10;
    start = 1;
  end

  initial begin
    #5;
    a = 16'h8;
    #20;
    $display("b=%h", b);
  end 


endmodule

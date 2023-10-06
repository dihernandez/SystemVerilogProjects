task task_a();
  while ($time < 50us) begin
    #1us;
    $display("in task a at time %d", $time);
  end
endtask : task_a

task task_b();
  #5us;
  $display("task b done");
endtask : task_b

task task_c();
  #5us;
  $display("task c done");
endtask : task_c

task run();
  fork : fork_a
    task_a();
  join_none
  
  fork : fork_b_c
    task_b();
    task_c();
  join_any
  
  $display("Reached disable at time %d", $time);
  disable fork_b_c;
    
  #10us;
  
endtask : run

module fork_join_tb();
  
initial begin
  run();
end
  
endmodule

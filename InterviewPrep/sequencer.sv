class my_sequencer;
  int id;
endclass : my_sequencer

class my_sequence;
  task start (my_sequencer seqr);
    int delay = $urandom_range(1,10);
    $display("time: %d starting sequence on sequencer with id %d", $time, seqr.id);
    #(delay*1us);
    $display("time: %d finishing sequence on sequencer with id %d", $time, seqr.id);
  endtask : start
endclass : my_sequence

module top();
  initial begin
    my_sequencer seqr;
    my_sequencer seqr_q[$];
    my_sequence seq;
    
    static int num_of_seqr = $urandom_range(3,5);
    
    for (int i = 0; i < num_of_seqr; i++) begin
      seqr = new;
      seqr.id = i;
      seqr_q.push_back(seqr);
    end
    
    for(int i = 0; i < num_of_seqr; i++) begin
      automatic int i_auto = i;
      fork : internal
        seq = new;
        seq.start(seqr_q[i_auto]);
      join_none : internal
    end
    wait fork;
    $display("time: %d end reached", $time);
  end
endmodule

class widget;
  int id;
  bit to_remove;
endclass : widget

module top();
  widget q[$];
  widget q_copy[$];
  initial begin
    widget w;
    int num = $urandom_range(20,40);
    int updated_num = 0;
    
    for(int i = 0; i < num; i++) begin
      w = new;
      w.id = i;
      w.to_remove = $urandom_range(0,1);
      q.push_back(w);
      $display("widget id is %02d, to remove is %b", w.id, w.to_remove);
    end
    
    for(int i = 0; i < num; i++) begin
      w = q.pop_front();
      if(w.to_remove == 0) begin
        updated_num++;
        q_copy.push_back(w);
      end
    end
        
    for(int i = 0; i < updated_num; i++) begin
      $display("Widget id %02d is ok", q_copy[i].id);
    end
  end
  
endmodule

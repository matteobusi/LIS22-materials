initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");
      repeat(5) @(posedge mclk);
      stimulus_done = 0;

      // Wait for the start of the test
      @(r15==16'hfeed);

      // Now, wait until completion
      @(r15==16'hdead);
      stimulus_done = 1;
   end


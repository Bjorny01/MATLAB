% Connect to your Moku and deploy the PID controller instrument

%Ide for testing: shift frequenzy just a litle, shifts back?

i = MokuPIDController('192.168.73.1');

try
    
    % Configure the control matrix
    i.set_control_matrix(1,1,0);
    i.set_control_matrix(2,0,1);
    % Enable all input and output channels
    i.enable_input(1,true);
    i.enable_input(2,true);
    i.enable_output(1,true,true);
    
    % Configure controller 1 by gain
    i.set_input_offset(1,0.2);
    % Configure controller 1 by gain
    i.set_by_frequency(1,'prop_gain',10);
    i.set_output_offset(1,0);
    
    
    % Place 2 monitor points, one at control 1 (after mixing), one at output 1
    i.set_monitor(1,'Control1');
    i.set_monitor(2,'Output1');
    % Configure the timebase to -2 ms and 2 ms
    i.set_timebase(-0.002,0.002);
    
    % Configure the trigger
    i.set_trigger('type',"Edge", 'source',"ProbeA", 'level',0);
    
    
    % Get initial data to set up plots
    data = i.get_data();
    
    % Set up the plots
    figure
    lh = plot(data.time, data.ch1, data.time, data.ch2);
    xlabel(gca,'Time (sec)')
    ylabel(gca,'Amplitude (V)')
    grid on
    grid(gca,'minor')
   
    while 1
        data = i.get_data();
        set(lh(1),'XData',data.time,'YData',data.ch1);
        set(lh(2),'XData',data.time,'YData',data.ch2);
        axis tight
        pause(0.1)
    end


catch ME
    % End the current connection session with your Moku
    i.relinquish_ownership();
    rethrow(ME)
end

i.relinquish_ownership();
 
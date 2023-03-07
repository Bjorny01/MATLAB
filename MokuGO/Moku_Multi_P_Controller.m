% Configure multi-instrument with platofrm_id 2
m = MokuMultiInstrument('192.168.73.1', 2);
ref = 1;%Put in reference voltage wanted

try
    %Wavegenerator in slot 1, PID in slot 2
    WG = m.set_instrument(1, @MokuWaveformGenerator);
    PID = m.set_instrument(2, @MokuPIDController);
    
    % configure routing
    %Input1 to Slot1InA not useful but has to have input,, PID gets one
    %input from Input1 (sensor) and one from Slot1OutA (generator gives
    %ref);
    connections = [struct('source', 'Input2', 'destination', 'Slot1InA');
                struct('source', 'Slot1OutA', 'destination', 'Slot2InA'); %Sets InA on PID to output from wg  
                struct('source', 'Input1', 'destination', 'Slot2InB');    %Set InB on PID analog input 1
                struct('source', 'Slot2OutA', 'destination', 'Output1')]; %Set output of PID to analog output 1
    m.set_connections(connections);

    % configure frontend
    m.set_frontend(1, "1MOhm", "DC", "0dB");
    
    % generate waveform
    WG.generate_waveform(1,'DC','dc_level',ref);
    
    %Set control matrix
    PID.set_control_matrix(1,1,0); %control signal = ref - output
    PID.set_control_matrix(2,0,0);
    % Enable all input and output channels
    PID.enable_input(1,true);
    PID.enable_input(2,true);
    PID.enable_output(1,true,true);
    
    % Configure controller 1 by gain (add offset for test)
    PID.set_by_frequency(1,'prop_gain',0);
    %PID.set_output_offset(1,0.1);
    
    % Place 2 monitor points, one at input 1, one at output 1
    PID.set_monitor(1,'Control1');  %monitor control signal (after mixing)
    PID.set_monitor(2,'Output1');   %monitor output 
    % Configure the timebase to -2 ms and 2 ms
    PID.set_timebase(-0.002,0.002);
    
    % Configure the trigger
    PID.set_trigger('type',"Edge", 'source',"ProbeA", 'level',0);
    
    
    % Get initial data to set up plots
    data = PID.get_data();
    
    % Set up the plots
    figure
    lh = plot(data.time, data.ch1, data.time, data.ch2);
    xlabel(gca,'Time (sec)')
    ylabel(gca,'Amplitude (V)')
    grid on
    grid(gca,'minor')

    while 1
        data = PID.get_data();
        set(lh(1),'XData',data.time,'YData',data.ch1);
        set(lh(2),'XData',data.time,'YData',data.ch2);
        axis tight
        pause(0.1)
    end
    
    catch ME
    % End the current connection session with your Moku
    m.relinquish_ownership();
    rethrow(ME)
end

m.relinquish_ownership();
    
    
    
    
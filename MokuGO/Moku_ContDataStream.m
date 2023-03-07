%Continuesly plot and measure data points from analog output 1
i = MokuDatalogger('192.168.73.1'); %connect to moku
    

try
    i.start_streaming('duration', 10);  %start a 30s data stream
    
    % Get initial data to set up plots
    data = i.get_stream_data();

    % Set up the plots
    figure
    lh = plot(data.time, data.ch1,'o');
    xlabel(gca,'Time (sec)')
    ylabel(gca,'Amplitude (V)')
    
    while 1
        data = i.get_stream_data();
        set(lh(1),'XData',data.time,'YData',data.ch1)
        
        %axis([0 30 0 5]);
        axis tight
        
        pause(0.1)
    end

catch ME
    i.stop_streaming();
    % End the current connection session with your Moku
    i.relinquish_ownership();
    rethrow(ME)
end

i.relinquish_ownership();


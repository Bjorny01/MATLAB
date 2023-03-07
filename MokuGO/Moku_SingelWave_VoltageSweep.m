%%
%Sweep voltage from 0-5V, set wavelength to 1500 something, measure and
%save data from the analog input 1



%% Connect to your Moku
% Connect to your Moku by its IP address.
%New comment test
i = MokuOscilloscope('192.168.73.1');
m = 1;
array_input = [];   %measured voltage at inpout 1   
array_output = [];  %inserted voltage from output 1

v_begin = 0;
v_end = 5;
v_step = 1;

N = (v_end-v_begin)/v_step;

try 
    for n = 1:(N+1)
        i.generate_waveform(1,'DC','dc_level',v_begin+(n-1)*v_step);
        pause(1);
        data = i.get_data('timeout',1);
        array_input(m) = mean(data.ch1);
        array_output(m) = v_begin+(n-1)*v_step;
        m = m + 1;
        
    end 
    
catch ME
    % End the current connection session with your Moku
    i.relinquish_ownership();
    rethrow(ME)
end

i.generate_waveform(1,'DC','dc_level',0);
i.relinquish_ownership();




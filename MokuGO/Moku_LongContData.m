i = MokuDatalogger('192.168.73.1'); %connect to moku
T = 30; %length of data log, in minutes

try
    % Enable precision mode
    i.set_acquisition_mode('mode','Precision');
    
    % Set the sample rate to 10 Sa/s is minimum
    i.set_samplerate(10);
    
    % Start the data logging session of 10 second and store the file on the RAM
    logging_request = i.start_logging('duration',60*T);
    log_file = logging_request.file_name;
    
    % Set up to display the logging process
    progress = i.logging_progress();
    
    while progress.time_to_end > 1
        fprintf('%d seconds remaining \n',progress.time_to_end)
        pause(1);
        progress = i.logging_progress();
    end
    
    % Download the log file from the Moku to "Users" folder
    % Moku:Go should be downloaded from "persist" and Moku:Pro from "ssd"
    i.download_file('persist',log_file,['C:\Users\bjorn\MATLAB Drive\KEX\Test' log_file]);

catch ME
    % End the current connection session with your Moku
    i.relinquish_ownership();
    rethrow(ME)
end

% End the current connection session with your Moku
i.relinquish_ownership();
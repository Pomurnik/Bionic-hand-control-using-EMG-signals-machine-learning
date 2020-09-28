function [reshaped_data] = reshape_data(data, time_period)

    % 1920000 samples = 480 sec, 480 sec per each finger
    time = (480 * time_period)/1920000;
    N = 480/time;
    reshaped_data = zeros(time_period*8, N);
    A1 = reshape(data, time_period, []);
    
    parfor k = 1:N
             
        reshaped_data(:,k) = reshape(A1(:,1+(k-1):N:size(A1,2)), time_period*8, []);
            
    end
    
    reshaped_data = reshaped_data';
        
end
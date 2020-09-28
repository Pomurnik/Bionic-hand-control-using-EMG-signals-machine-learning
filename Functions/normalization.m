function [data] = normalization(input)
    
    data = zeros(size(input,1), size(input,2));
    
    parfor i = 1:size(input,2)
        
        i_mean = mean(input(:,i));
        data(:,i) = input(:,i)-i_mean;
        
    end

end
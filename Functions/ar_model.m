function [data] = ar_model(input, n , z)
    
    data = zeros(size(input,1),(n*8));
    
    parfor k = 1:size(input,1)
        
        data_a = zeros(1,(n*8));
        
        for i = 1:8
        
            sys = ar(input(k,1 + ((i-1)*z): z + ((i-1)*z)),n);
            data_a(1,1 + ((i-1)*n): n + ((i-1)*n)) = sys.A(1,2:end);
            
        end
        
        data(k,:) = data_a;
        
    end

end
function [data] = HjorthParameters(input, z)
    
    f = 3; %number of features
    data = zeros(size(input,1),(f*8));
    
    parfor k = 1:size(input,1)
        
        data_a = zeros(1,(f*8));
        
        for i = 1:8
            
            dxV = diff([0;input(k,1 + ((i-1)*z): z + ((i-1)*z))']);
            ddxV = diff([0;dxV]);
            mx2 = mean(input(k,1 + ((i-1)*z): z + ((i-1)*z))'.^2);
            mdx2 = mean(dxV.^2);
            mddx2 = mean(ddxV.^2);

            mob = mdx2 / mx2;
            complexity = sqrt(mddx2 / mdx2 - mob);
            mobility = sqrt(mob);
            activity = mx2;
            
            A = [activity, mobility, complexity];
            data_a(1,1 + ((i-1)*f): f + ((i-1)*f)) = A;
            
        end
        
        data(k,:) = data_a;
        
    end
end
function [pca_dimension] = pca_dimension_check(input)
    
    for i = 1:size(input,1)
        
        pca_dimension = sum(input(1:i))/sum(input);
        
        if pca_dimension >= 0.99
            
            pca_dimension = i;
            break
            
        end
    end
end
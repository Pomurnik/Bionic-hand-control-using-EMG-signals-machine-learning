function [target_label] = target_logical_label(input, number_of_classes)
    
    target_label = zeros(input, number_of_classes);
    num_per_class = input/number_of_classes;
    
    for i = 1:number_of_classes
                
        target_label(1 + ((i-1)*num_per_class): num_per_class + ((i-1)*num_per_class), i) = 1;
        
    end
    
    target_label = logical(target_label);
   
end
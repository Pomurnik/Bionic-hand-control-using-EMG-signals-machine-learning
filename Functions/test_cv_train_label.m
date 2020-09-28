function [label_train, label_cv, label_test, row_train, row_cv, row_test] = test_cv_train_label(target, all_data, data_train, data_test, data_cv)

    for i = 1:size(data_cv,1)
        
        [row_cv(i,1), col_cv] = find(data_cv(i,1) == all_data(:,1));
        [row_test(i,1), col_test] = find(data_test(i,1) == all_data(:,1));
        
        label_cv = target(row_cv, :);
        label_test = target(row_test, :);
        
    end

    for i = 1:size(data_train,1)
        
        [row_train(i,1), col_cv] = find(data_train(i,1) == all_data(:,1));
                
        label_train = target(row_train, :);
                
    end    
    
end
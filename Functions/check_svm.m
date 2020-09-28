function [time_svm, accuracy_svm] = check_svm(all_data_normalized, all_data_pca, y_label, target_label, n)
    
    for i = 1:10
        
        template = templateSVM(...
            'KernelFunction', 'polynomial', ...
            'PolynomialOrder', 3, ...
            'KernelScale', 'auto', ...
            'BoxConstraint', 1, ...
            'Standardize', true);
        
        if n == 1
            [data_test_a, ~, data_train_a, y_label_test_a, ~, y_label_train_a, ~, ...
             ~, ~, ~, ~, ~, ~, ~, ~] = split_data_label_train_cv_test(all_data_normalized, all_data_pca, y_label, target_label);
            data_test{i} = data_test_a;
            data_train{i} = data_train_a;
            y_label_test{i} = y_label_test_a;
            y_label_train{i} = y_label_train_a;
            
            tic
            mdl_svm = fitcecoc(...
                data_train{i}, y_label_train{i}, ...
                'Learners', template, ...
                'Coding', 'onevsall');
            et(i,1) = toc;
        
        predicted_svm = predict(mdl_svm, data_test{i});
        incorrectly_classified_svm = sum(predicted_svm ~= y_label_test{i});
        accuracy_sv(i,1) = (size(predicted_svm,1)- incorrectly_classified_svm) / size(predicted_svm,1) * 100;
            
        elseif n == 0
            [~, ~, ~, y_label_test_a, ~, y_label_train_a, data_test_a, ...
            ~, data_train_a, ~, ~, ~, ~, ~, ~] ...
            = split_data_label_train_cv_test(all_data_normalized, all_data_pca, y_label, target_label);
            data_test{i} = data_test_a;
            data_train{i} = data_train_a;
            y_label_test{i} = y_label_test_a;
            y_label_train{i} = y_label_train_a;
            
            tic
            mdl_svm = fitcecoc(...
                data_train{i}, y_label_train{i}, ...
                'Learners', template, ...
                'Coding', 'onevsall');
            et(i,1) = toc;
        
        predicted_svm = predict(mdl_svm, data_test{i});
        incorrectly_classified_svm = sum(predicted_svm ~= y_label_test{i});
        accuracy_sv(i,1) = (size(predicted_svm,1)- incorrectly_classified_svm) / size(predicted_svm,1) * 100;
        
        end
        
    end
    
    accuracy_svm = accuracy_sv;
    time_svm = et;
    
end
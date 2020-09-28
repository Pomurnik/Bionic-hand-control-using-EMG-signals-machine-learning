function [time_knn, accuracy_knn] = check_knn(mdl_knn, all_data_normalized, all_data_pca, y_label, target_label, n)
    
    a = mdl_knn.Distance;
    b = mdl_knn.NumNeighbors;
    
    for i = 1:10
        
        if n == 1
            [data_test_a, ~, data_train_a, y_label_test_a, ~, y_label_train_a, ~, ...
             ~, ~, ~, ~, ~, ~, ~, ~] = split_data_label_train_cv_test...
            (all_data_normalized, all_data_pca, y_label, target_label);
            data_test{i} = data_test_a;
            data_train{i} = data_train_a;
            y_label_test{i} = y_label_test_a;
            y_label_train{i} = y_label_train_a;
            
            tic
            mdl_knn = fitcknn(data_train{i}, y_label_train{i}, 'NumNeighbors', b, 'Distance', a);
            et(i,1) = toc;
            predicted_knn = predict(mdl_knn, data_test{i});

            incorrectly_classified_knn = sum(predicted_knn ~= y_label_test{i});
            accuracy_kn(i,1) = (size(predicted_knn,1) - incorrectly_classified_knn) / size(predicted_knn,1) * 100;     
        
        elseif n == 0
            [~, ~, ~, y_label_test_a, ~, y_label_train_a, data_test_a, ...
            ~, data_train_a, ~, ~, ~, ~, ~, ~] ...
            = split_data_label_train_cv_test(all_data_normalized, all_data_pca, y_label, target_label);
            data_test{i} = data_test_a;
            data_train{i} = data_train_a;
            y_label_test{i} = y_label_test_a;
            y_label_train{i} = y_label_train_a;
            
            tic
            mdl_knn = fitcknn(data_train{i}, y_label_train{i}, 'NumNeighbors', b, 'Distance', a);
            et(i,1) = toc;
            predicted_knn = predict(mdl_knn, data_test{i});

            incorrectly_classified_knn = sum(predicted_knn ~= y_label_test{i});
            accuracy_kn(i,1) = (size(predicted_knn,1) - incorrectly_classified_knn) / size(predicted_knn,1) * 100;
            
        end
        

        
    end
    
    accuracy_knn = accuracy_kn;
    time_knn = et;
    
end
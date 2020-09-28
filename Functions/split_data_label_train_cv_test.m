function [data_test, data_cv, data_train, y_label_test, y_label_cv, y_label_train, data_test_pca, ...
    data_cv_pca, data_train_pca, label_train, label_cv, label_test, row_train, row_cv, row_test] ...
    = split_data_label_train_cv_test(all_data_normalized, all_data_pca, y_label, target_label)
    
    test = cvpartition(size(all_data_normalized,1),'HoldOut',0.2);
    idx_test = test.test;

    data_train_a = all_data_normalized(~idx_test,:);
    data_test  = all_data_normalized(idx_test,:);

    y_label_train_a = y_label(~idx_test,:);
    y_label_test = y_label(idx_test,:);

	cv = cvpartition(size(data_train_a,1),'HoldOut',0.25);
    idx_cv = cv.test;

    data_cv  = data_train_a(idx_cv,:);
    data_train = data_train_a(~idx_cv,:);

    y_label_cv = y_label_train_a(idx_cv,:);
    y_label_train = y_label_train_a(~idx_cv,:);

    data_train__pac_a = all_data_pca(~idx_test,:);
    data_test_pca  = all_data_pca(idx_test,:);

    data_cv_pca  = data_train__pac_a(idx_cv,:);
    data_train_pca = data_train__pac_a(~idx_cv,:);

    [label_train, label_cv, label_test, row_train, row_cv, row_test] ...
        = test_cv_train_label(target_label, all_data_normalized, data_train, data_test, data_cv);

end
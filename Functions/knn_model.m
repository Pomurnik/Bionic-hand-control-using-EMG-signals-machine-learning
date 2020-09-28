function [mdl_knn, incorrectly_classified_knn, accuracy_knn] = knn_model(data_train, data_test, y_label_train , y_label_test)

    mdl_knn = fitcknn(data_train, y_label_train,'OptimizeHyperparameters','auto',...
        'HyperparameterOptimizationOptions',...
        struct('AcquisitionFunctionName','expected-improvement-plus'))
    close all
    predicted_knn = predict(mdl_knn, data_test);

    incorrectly_classified_knn = sum(predicted_knn ~= y_label_test);
    accuracy_knn = (size(predicted_knn,1) - incorrectly_classified_knn) / size(predicted_knn,1) * 100;

end
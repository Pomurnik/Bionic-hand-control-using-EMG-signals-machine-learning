function [time_ann, accuracy_ann] = check_ann(num_neurons, all_data_normalized, all_data_pca, y_label, target_label, n)

    count = gpuDeviceCount
    gpu1 = gpuDevice(1)
    
    for i = 1:10
        
        if n == 1
            [data_test_a, ~, ~, ~, ~, ~, ~, ...
             ~, ~, ~, ~, label_test_a, row_train_a, row_cv_a, row_test_a] = split_data_label_train_cv_test(all_data_normalized, all_data_pca, y_label, target_label);
            data_test{i} = data_test_a;
            label_test{i} = label_test_a;
            row_train{i} = row_train_a;
            row_cv{i} = row_cv_a;
            row_test{i} = row_test_a;
            
            nn_d = all_data_normalized';
            nn_l = target_label';
            nn_data = nndata2gpu(nn_d, 'double');
            nn_label = nndata2gpu(nn_l, 'double');
            nn_data = nn_data';
            nn_label = nn_label';
            OurNet = patternnet([num_neurons num_neurons]); 
            OurNet.divideFcn = 'divideind'; 
            OurNet.divideMode = 'sample';
            OurNet.divideParam.trainInd = row_train{i}';     
            OurNet.divideParam.valInd = row_cv{i}';      
            OurNet.divideParam.testInd = row_test{i}'; 
            OurNet.trainFcn = 'trainscg';
            OurNet.performFcn = 'crossentropy'; 
            OurNet.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
            'plotconfusion', 'plotroc'};
            OurNet.input.processFcns = {'mapminmax'};
            OurNet = configure(OurNet,nn_d, nn_l);
            tic
            [OurNet, Tr] = train(OurNet, nn_data, nn_label,'useGpu','yes','showResources','yes');
            et(i,1) = toc;
            predicted_ann_gpu = OurNet(data_test{i}');
            predicted_ann = gpu2nndata(predicted_ann_gpu);
            predicted_ann = round(predicted_ann);
            %figure, plotconfusion(targets,outputs)
            incorrectly_classified_ann = sum(sum(predicted_ann ~= label_test{i}));
            accuracy_an(i,1) = (size(predicted_ann,1) - incorrectly_classified_ann) / size(predicted_ann,1) * 100;
        
        elseif n == 0
            [~, ~, ~, ~, ~, ~, data_test_a, ...
            ~, ~, ~, ~, label_test_a, row_train_a, row_cv_a, row_test_a] ...
            = split_data_label_train_cv_test(all_data_normalized, all_data_pca, y_label, target_label);
            data_test{i} = data_test_a;
            label_test{i} = label_test_a;
            row_train{i} = row_train_a;
            row_cv{i} = row_cv_a;
            row_test{i} = row_test_a;
            
             nn_d = all_data_pca';
            nn_l = target_label';
            nn_data = nndata2gpu(nn_d, 'double');
            nn_label = nndata2gpu(nn_l, 'double');
            nn_data = nn_data';
            nn_label = nn_label';
            OurNet = patternnet([num_neurons num_neurons]); 
            OurNet.divideFcn = 'divideind'; 
            OurNet.divideMode = 'sample';
            OurNet.divideParam.trainInd = row_train{i}';     
            OurNet.divideParam.valInd = row_cv{i}';      
            OurNet.divideParam.testInd = row_test{i}'; 
            OurNet.trainFcn = 'trainscg';
            OurNet.performFcn = 'crossentropy'; 
            OurNet.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
            'plotconfusion', 'plotroc'};
            OurNet.input.processFcns = {'mapminmax'};
            OurNet = configure(OurNet,nn_d, nn_l);
            tic
            [OurNet, Tr] = train(OurNet, nn_data, nn_label,'useGpu','yes','showResources','yes');
            et(i,1) = toc;
            predicted_ann_gpu = OurNet(data_test{i}');
            predicted_ann = gpu2nndata(predicted_ann_gpu);
            predicted_ann = round(predicted_ann);
            %figure, plotconfusion(targets,outputs)
            incorrectly_classified_ann = sum(sum(predicted_ann ~= label_test{i}));
            accuracy_an(i,1) = (size(predicted_ann,1) - incorrectly_classified_ann) / size(predicted_ann,1) * 100;
            
        end
        
    end
    
    accuracy_ann = accuracy_an;
    time_ann = et;
    
end
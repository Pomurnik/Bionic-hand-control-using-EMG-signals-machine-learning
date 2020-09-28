function [mdl_ann, incorrectly_classified_ann, accuracy_ann, num_neurons] = ann_model(all_data, data_test, target_label, label_test, row_train, row_cv, row_test, k)

    count = gpuDeviceCount
    gpu1 = gpuDevice(1)
    nn_d = all_data';
    nn_l = target_label';
    nn_data = nndata2gpu(nn_d, 'double');
    nn_label = nndata2gpu(nn_l, 'double');
    nn_data = nn_data';
    nn_label = nn_label';

    parfor i = 1:k

        tic
        OurNet = patternnet([i i]); 
        OurNet.divideFcn = 'divideind'; 
        OurNet.divideMode = 'sample';
        OurNet.divideParam.trainInd = row_train';     
        OurNet.divideParam.valInd = row_cv';      
        OurNet.divideParam.testInd = row_test'; 
        OurNet.trainFcn = 'trainscg';
        OurNet.performFcn = 'crossentropy'; 
        OurNet.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
        'plotconfusion', 'plotroc'};
        OurNet.input.processFcns = {'mapminmax'};
        OurNet = configure(OurNet,nn_d, nn_l);
        [OurNet, Tr] = train(OurNet, nn_data, nn_label,'useGpu','yes','showResources','yes'); 
        ON{i,1} = OurNet;
        TR{i,1} = Tr;
        efficiency(i) = Tr.best_vperf;
        toc

    end 

    [M, I] = min(efficiency);
    mdl_ann = ON{I,1};
    tr = TR{I,1};
    num_neurons = I;
    predicted_ann_gpu = mdl_ann(data_test');
    predicted_ann = gpu2nndata(predicted_ann_gpu);
    predicted_ann = round(predicted_ann);
    %figure, plotconfusion(targets,outputs)
    incorrectly_classified_ann = sum(sum(predicted_ann ~= label_test));
    accuracy_ann = (size(predicted_ann,1) - incorrectly_classified_ann) / size(predicted_ann,1) * 100;
    
end
clc
clear all
close all

addpath('Functions/')  

%% Load and fillter data
tic 
Thumb = 'T_T';
[thumb, t] = read_file(Thumb);
Index = 'I_I';
[index, t] = read_file(Index);
Middle = 'M_M';
[middle, t] = read_file(Middle);
Ring = 'R_R';
[ring, t] = read_file(Ring);
Little = 'L_L';
[little, t] = read_file(Little);
Thumb_Index = 'T_I';
[thumb_index, t] = read_file(Thumb_Index);
Thumb_Middle = 'T_M';
[thumb_middle, t] = read_file(Thumb_Middle);
Thumb_Ring = 'T_R';
[thumb_ring, t] = read_file(Thumb_Ring);
Thumb_little = 'T_L';
[thumb_little, t] = read_file(Thumb_little);
Index_Middle = 'I_M';
[index_middle, t] = read_file(Index_Middle);
Middle_Ring = 'M_R';
[middle_ring, t] = read_file(Middle_Ring);
Ring_Little = 'R_L';
[ring_little, t] = read_file(Ring_Little);
Index_Middle_Ring = 'IMR';
[index_middle_ring, t] = read_file(Index_Middle_Ring);
Middle_Ring_Little = 'MRL';
[middle_ring_little, t] = read_file(Middle_Ring_Little);
Hand_Close = 'HC_';
[hand_close, t] = read_file(Hand_Close);

%% Reshape data 

time_period = 1000;
time = 0.250;

thumb_reshaped = reshape_data(thumb, time_period);
index_reshaped = reshape_data(index, time_period);
middle_reshaped = reshape_data(middle, time_period);
ring_reshaped = reshape_data(ring, time_period);
little_reshaped = reshape_data(little, time_period);
thumb_index_reshaped = reshape_data(thumb_index, time_period);
thumb_middle_reshaped = reshape_data(thumb_middle, time_period);
thumb_ring_reshaped = reshape_data(thumb_ring, time_period);
thumb_little_reshaped = reshape_data(thumb_little, time_period);
index_middle_reshaped = reshape_data(index_middle, time_period);
middle_ring_reshaped = reshape_data(middle_ring, time_period);
ring_little_reshaped = reshape_data(ring_little, time_period);
index_middle_ring_reshaped = reshape_data(index_middle_ring, time_period);
middle_ring_little_reshaped = reshape_data(middle_ring_little, time_period);
hand_close_reshaped = reshape_data(hand_close, time_period);


%% AR model

n = 11;

[ar_thumb] = ar_model(thumb_reshaped, n, time_period);
[ar_index] = ar_model(index_reshaped, n, time_period);
[ar_middle] = ar_model(middle_reshaped, n, time_period);
[ar_ring] = ar_model(ring_reshaped, n, time_period);
[ar_little] = ar_model(little_reshaped, n, time_period);
[ar_thumb_index] = ar_model(thumb_index_reshaped, n, time_period);
[ar_thumb_middle] = ar_model(thumb_middle_reshaped, n, time_period);
[ar_thumb_ring] = ar_model(thumb_ring_reshaped, n, time_period);
[ar_thumb_little] = ar_model(thumb_little_reshaped, n, time_period);
[ar_index_middle] = ar_model(index_middle_reshaped, n, time_period);
[ar_middle_ring] = ar_model(middle_ring_reshaped, n, time_period);
[ar_ring_little] = ar_model(ring_little_reshaped, n, time_period);
[ar_index_middle_ring] = ar_model(index_middle_ring_reshaped, n, time_period);
[ar_middle_ring_little] = ar_model(middle_ring_little_reshaped, n, time_period);
[ar_hand_close] = ar_model(hand_close_reshaped, n, time_period);

%% Hjorth parameters

[hjorth_thumb] = HjorthParameters(thumb_reshaped, time_period);
[hjorth_index] = HjorthParameters(index_reshaped, time_period);
[hjorth_middle] = HjorthParameters(middle_reshaped, time_period);
[hjorth_ring] = HjorthParameters(ring_reshaped, time_period);
[hjorth_little] = HjorthParameters(little_reshaped, time_period);
[hjorth_thumb_index] = HjorthParameters(thumb_index_reshaped, time_period);
[hjorth_thumb_middle] = HjorthParameters(thumb_middle_reshaped, time_period);
[hjorth_thumb_ring] = HjorthParameters(thumb_ring_reshaped, time_period);
[hjorth_thumb_little] = HjorthParameters(thumb_little_reshaped, time_period);
[hjorth_index_middle] = HjorthParameters(index_middle_reshaped, time_period);
[hjorth_middle_ring] = HjorthParameters(middle_ring_reshaped, time_period);
[hjorth_ring_little] = HjorthParameters(ring_little_reshaped, time_period);
[hjorth_index_middle_ring] = HjorthParameters(index_middle_ring_reshaped, time_period);
[hjorth_middle_ring_little] = HjorthParameters(middle_ring_little_reshaped, time_period);
[hjorth_hand_close] = HjorthParameters(hand_close_reshaped, time_period);

%% Wavlet transform parameters 

[wavlet_thumb] = wavlet_features(thumb_reshaped, 4, 'db4', time_period);
[wavlet_index] = wavlet_features(index_reshaped, 4, 'db4', time_period);
[wavlet_middle] = wavlet_features(middle_reshaped, 4, 'db4', time_period);
[wavlet_ring] = wavlet_features(ring_reshaped, 4, 'db4', time_period);
[wavlet_little] = wavlet_features(little_reshaped, 4, 'db4', time_period);
[wavlet_thumb_index] = wavlet_features(thumb_index_reshaped, 4, 'db4', time_period);
[wavlet_thumb_middle] = wavlet_features(thumb_middle_reshaped, 4, 'db4', time_period);
[wavlet_thumb_ring] = wavlet_features(thumb_ring_reshaped, 4, 'db4', time_period);
[wavlet_thumb_little] = wavlet_features(thumb_little_reshaped, 4, 'db4', time_period);
[wavlet_index_middle] = wavlet_features(index_middle_reshaped, 4, 'db4', time_period);
[wavlet_middle_ring] = wavlet_features(middle_ring_reshaped, 4, 'db4', time_period);
[wavlet_ring_little] = wavlet_features(ring_little_reshaped, 4, 'db4', time_period);
[wavlet_index_middle_ring] = wavlet_features(index_middle_ring_reshaped, 4, 'db4', time_period);
[wavlet_middle_ring_little] = wavlet_features(middle_ring_little_reshaped, 4, 'db4', time_period);
[wavlet_hand_close] = wavlet_features(hand_close_reshaped, 4, 'db4', time_period);

%% Combine data

ar_data = vertcat(ar_thumb, ar_index, ar_middle, ar_ring, ar_little, ar_thumb_index, ...
    ar_thumb_middle, ar_thumb_ring, ar_thumb_little, ar_index_middle, ar_middle_ring, ....
    ar_ring_little, ar_index_middle_ring, ar_middle_ring_little, ar_hand_close);

hjorth_data = vertcat(hjorth_thumb, hjorth_index, hjorth_middle, hjorth_ring, hjorth_little, ....
    hjorth_thumb_index, hjorth_thumb_middle, hjorth_thumb_ring, hjorth_thumb_little, ...
    hjorth_index_middle, hjorth_middle_ring, hjorth_ring_little, hjorth_index_middle_ring, ...
    hjorth_middle_ring_little, hjorth_hand_close);

wavlet_data = vertcat(wavlet_thumb, wavlet_index, wavlet_middle, wavlet_ring, wavlet_little, ....
    wavlet_thumb_index, wavlet_thumb_middle, wavlet_thumb_ring, wavlet_thumb_little, ....
    wavlet_index_middle, wavlet_middle_ring, wavlet_ring_little, wavlet_index_middle_ring, ...
    wavlet_middle_ring_little, wavlet_hand_close);

all_data = vertcat(ar_data', hjorth_data', wavlet_data');
all_data = all_data';

%% Normalization

clearvars -except all_data time
[all_data_normalized] = normalization(all_data);

%% PCA

[coeff,score,latent] = pca(all_data_normalized);
[pca_dimension] = pca_dimension_check(latent);
all_data_pca = all_data_normalized * coeff(1:size(coeff,1), 1:pca_dimension);

%% Labeling data

k = ones(480/time,1)*(1:15);
out = k(:);
y_label = out;

target_label = target_logical_label(size(y_label,1), 15);

%% Spliting data to train, cross validation and test sets

[data_test, data_cv, data_train, y_label_test, y_label_cv, y_label_train, data_test_pca, ...
    data_cv_pca, data_train_pca, label_train, label_cv, label_test, row_train, row_cv, row_test] ...
    = split_data_label_train_cv_test(all_data_normalized, all_data_pca, y_label, target_label);

%% Train model knn

[mdl_knn, incorrectly_classified_knn, accuracy_knn] = knn_model(data_train, data_test, y_label_train , y_label_test);
[mdl_knn_pca, incorrectly_classified_knn_pca, accuracy_knn_pca] = knn_model(data_train_pca, data_test_pca, y_label_train , y_label_test);

%% Train model SVM

[mdl_svm, incorrectly_classified_svm, accuracy_svm] = svm_model(data_train, data_test, y_label_train , y_label_test);
[mdl_svm_pca, incorrectly_classified_svm_pca, accuracy_svm_pca] = svm_model(data_train_pca, data_test_pca, y_label_train , y_label_test);

%% Train model ANN

% tic
[mdl_ann, incorrectly_classified_ann, accuracy_ann, num_neurons] = ann_model(all_data_normalized, data_test, ....
    target_label, label_test, row_train, row_cv, row_test, 100);
[mdl_ann_pca, incorrectly_classified_ann_pca, accuracy_ann_pca, num_neurons_pca] = ann_model(all_data_pca, ....
    data_test_pca, target_label, label_test, row_train, row_cv, row_test, 100);

%% Choose best model

models = {accuracy_knn mdl_knn; accuracy_knn_pca mdl_knn_pca; accuracy_svm mdl_svm; accuracy_svm_pca mdl_svm_pca; ...
    accuracy_ann mdl_ann; accuracy_ann_pca mdl_ann_pca};
[M, I] = max([models{:,1}]);
mdl = models{I,2};

%% Prepare signals to simulink 

signals = data_test(38:382:end, :);

%% Export data to disk

%save('signals_model_simulink', 'mdl', 'signals');

%% Save models and data

% save('Functions/model_error', 'mdl_ann', 'mdl_ann_pca', 'mdl_knn', 'mdl_knn_pca', 'mdl_svm', 'mdl_svm_pca', ...
%     'all_data_normalized', 'all_data_pca', 'target_label', 'y_label', 'num_neurons', 'num_neurons_pca');

toc

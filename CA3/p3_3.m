clc
clearvars
close all

load('trainSetDiabetes.mat')
load('trainedLinearSvmModel.mat')

pred_labels = predict_labels('trainedLinearSvmModel.mat', trainedModel, 'trainSetDiabetes.mat', diabetestraining);

real_labels = diabetestraining(:,7);
real_labels = table2array(real_labels);

[TP, FP, TN, FN] = check_predictions(real_labels, pred_labels);
[accuracy, precision, recall, f1] = evaluate_model(TP, FP, TN, FN);


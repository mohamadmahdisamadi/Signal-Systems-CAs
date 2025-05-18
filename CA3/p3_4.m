clc
clearvars
close all

load('testSetDiabetes.mat')
load('trainedLinearSvmModel.mat')

pred_labels = predict_labels('trainedLinearSvmModel.mat', trainedModel, 'testSetDiabetes.mat', diabetesvalidation);

real_labels = diabetesvalidation(:,7);
real_labels = table2array(real_labels);

[TP, FP, TN, FN] = check_predictions(real_labels, pred_labels);
[accuracy, precision, recall, f1] = evaluate_model(TP, FP, TN, FN);


function [accuracy, precision, recall, f1]=evaluate_model(TP, FP, TN, FN)
    accuracy = (TP + TN) / (TP + TN + FP + FN);
    precision = (TP) / (TP + FP);
    recall = (TP) / (TP + FN);
    f1 = 2 * (precision * recall) / (precision + recall);
end
function [TP, FP, TN, FN]=check_predictions(true, preds)
    n1 = length(true);
    n2 = length(preds);
    if (n1 ~= n2)
        fprintf('size of two arrays do not match!\n');
        return
    end
    n = n1;
    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;

    for i=1:1:n
        if true(i) == 1 && preds(i) == 1
            TP = TP + 1;
        end

        if true(i) == 1 && preds(i) == 0
            FN = FN + 1;
        end

        if true(i) == 0 && preds(i) == 1
            FP = FP + 1;
        end

        if true(i) == 0 && preds(i) == 0
            TN = TN + 1;
        end
    end
end
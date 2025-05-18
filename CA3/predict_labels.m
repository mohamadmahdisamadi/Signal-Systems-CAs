function predicted_labels=predict_labels(model_file, model_name, dataset_file, dataset_name)
    load(model_file);
    load(dataset_file);
    predicted_labels = model_name.predictFcn(dataset_name);
end
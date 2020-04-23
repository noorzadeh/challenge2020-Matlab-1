function [score, label] = run_12ECG_classifier(data,header_data,classes, model)

    num_classes = length(classes);

    label = zeros([1,num_classes]);
    score = ones([1,num_classes]);
    allClasses = model.class;
    % Use your classifier here to obtain a label and score for each class.
    features = get_features(data,header_data);

    score = test (model.net,features');
    label (score>0.5)=1;
end




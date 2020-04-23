function model = load_12ECG_model()

        load mymodel.mat
        model.class = allClasses;
        model.net   = net;
        model.tr    = tr;

end



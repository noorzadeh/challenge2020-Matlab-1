function [data,tlines] = load_challenge_data(filename)

        % Opening header file
        fid=fopen([filename '.hea']);
        if (fid<=0)
                disp(['error in opening file ' filename]);
        end

        tline = fgetl(fid);
        tlines = cell(0,1);
        while ischar(tline)
            tlines{end+1,1} = tline;
            tline = fgetl(fid);
        end
        fclose(fid);

        f=load([filename '.mat']);
        try
                data = f.val;
        catch ex
                rethrow(ex);
        end

end
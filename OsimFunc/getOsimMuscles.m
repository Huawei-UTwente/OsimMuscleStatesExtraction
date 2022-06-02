function osimMuscleList = getOsimMuscles(OsimModel, MuscleNames)

    osimMuscleList = [];
    osimMuscleOrder = [];

    % get muscle list
    muscleList = OsimModel.getMuscleList();

    % select Osim muscle based on the muscle name
    iter = muscleList.begin();

    while iter ~= muscleList.end() % run through all Osim muscle until get the same muscle name
        if ismember(string(iter.getName()), MuscleNames)
            osimMuscleList = [osimMuscleList, iter.deref()];
            osimMuscleOrder = [osimMuscleOrder, find(strcmp(MuscleNames, string(iter.getName())))];
        end
        
        % if the Osim muscle length is the same as the provided muscle
        % string names, then stop
        if length(osimMuscleOrder) == length(MuscleNames)
            break;
        else
            iter.next();
        end
    end
    
    % get the correct order of the Osim muscle models
    osimMuscleList = osimMuscleList(osimMuscleOrder);
    
end
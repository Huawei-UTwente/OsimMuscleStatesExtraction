function osimCoordinateList = getOsimCoordinates(OsimModel, coordinateNames)

    osimCoordinateList = [];
    osimCoordinateOrder = [];

    % get coordinate list
    coordinateList = OsimModel.getCoordinateSet();
    coordinateNum = OsimModel.getNumCoordinates();
    
    for iter = 0:coordinateNum   % run through all coordinate until get the same name
        if ismember(string(coordinateList.get(iter)), coordinateNames)
            osimCoordinateList = [osimCoordinateList, coordinateList.get(iter)];
            osimCoordinateOrder = [osimCoordinateOrder,...
                find(strcmp(coordinateNames, string(coordinateList.get(iter))))];
        end
        
        % if the length of Osim coordinate equals the provided coordinate
        % string list, then stop.
        if length(osimCoordinateOrder) == length(coordinateNames)
            break;
        end
    end
    
    % get the correct order of the Osim coordinate names
    osimCoordinateList = osimCoordinateList(osimCoordinateOrder);
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pre-processing of the gait data
%
% By: Huawei Wang
% Date: 04/05/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

% information for extracting the osim info
dataFile = "TestData/walk_36.mat";
osimModelFile = "TestData/gait2392.osim";
muscleNames = ["soleus_r", "lat_gas_r", "med_gas_r", "tib_ant_r"];
coordNames = ["ankle_angle_r"];

% general parameters
M = length(muscleNames);
J = length(coordNames);

% get muscle parameters
[lce_opt0, lt_slack0, theta0, Fmax0] = ...
    getOsimMuscleParameter(osimModelFile, muscleNames);

% load propcessed experimental data
processedData = importdata(dataFile);

% get muscle length and moment arms
ikData.data = processedData.Resample.Sych.Average.IKAngData.ave_r;
ikData.colheaders = processedData.Resample.Sych.IKAngDataLabel;

[lmt, ma] = getOsimMuscleLengthMA(osimModelFile, ikData, ...
    muscleNames(1:M), coordNames);

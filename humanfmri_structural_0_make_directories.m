function subject_dir = humanfmri_structural_0_make_directories(subject_code, varargin)

% The function creates directories to save data
%
% :Usage:
% ::
%   projectdir = '/Volumes/habenula/hbmnas/data/Pain_Sound_test';
%   subject_dir = apfmri_structural_0_make_directories(subject_code, 'projectdir', projectdir, 'run_num', 4)
%    
%

run_num = 2;
projectdir = pwd;

for i = 1:numel(varargin)
    if ischar(varargin{i})
        switch varargin{i}
            case {'projectdir'} % in seconds
                projectdir = varargin{i+1};
            case {'run_num'}
                run_num = varargin{i+1};
        end
    end
end

subject_dir = fullfile(projectdir, 'Imaging', subject_code);

Structural_dir = fullfile(subject_dir, 'Structural');
Functional_dir = fullfile(subject_dir, 'Functional');

mkdir(sprintf('%s/dicom', Structural_dir));

for i = 1:run_num
    mkdir(sprintf('%s/dicom/r%02d', Functional_dir, i));
end
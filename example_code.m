projectdir = '/Volumes/habenula/hbmnas/data/Pain_Sound_test';
subject_code = '20170612_WCW';
run_num = 4;

subject_dir = humanfmri_structural_0_make_directories(subject_code, 'projectdir', projectdir, 'run_num', run_num);
PREPROC = humanfmri_structural_1_dicom2nifti(subject_dir);

PREPROC = humanfmri_functional_1_dicom2nifti(subject_dir, 1:4, 22);

% HCP distortion correction

PREPROC = humanfmri_functional_2_implicitmask_savemean(subject_dir, 1:4);

PREPROC = humanfmri_structural_2_coregistration(subject_dir);

% humanfmri_structural_3_reorientation(subject_dir)

PREPROC = humanfmri_structural_5_segment(subject_dir, 'woreorient')
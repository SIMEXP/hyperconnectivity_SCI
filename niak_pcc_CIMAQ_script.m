% This option is useful when scrubbing is used, and the resulting time series may be too short.
opt_g.min_nb_vol = 100;

% Specify to the grabber to prepare the files for the connectome pipeline
opt_g.type_files = "glm_connectome";
opt_g.filter.session = {'rest'}


path = "/home/hanads/Documents/cimaq/niak_preprocess_cimaq/cimaq_preprocess_func/cimaq_mem_rest_output2/"

files_in.fmri = niak_grab_fmri_preprocess(path,opt_g).fmri

%Specify the template
files_in.network = "/home/hanads/Documents/cimaq/cimaq_rmaps/MIST_122.nii.gz";

%Specify seeds (ROI)
files_in.seeds = ["/home/hanads/Documents/cimaq/cimaq_rmaps/list_seeds_pcc.csv"];
opt_csv.labels_x = { 'pcc'}; % The labels for the network
opt_csv.labels_y = {'index'};
tab = [24];
niak_write_csv(files_in.seeds,tab,opt_csv);

opt.folder_out="/data/cisl/hyperconnectivity_SCI/pcc"

%Pipeline options
opt.flag_p2p = false; % No parcel-to-parcel correlation values
opt.flag_global_prop = false; % No global graph properties
opt.flag_local_prop  = false; % No local graph properties
opt.flag_rmap = true; % Generate correlation maps

%Running the pipeline
opt.flag_test = false;
[pipeline,opt] = niak_pipeline_connectome(files_in,opt);

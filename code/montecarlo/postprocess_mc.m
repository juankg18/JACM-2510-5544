function results = postprocess_mc(omega_all, Nsamples, t_mc)
time_per = t_mc/Nsamples;
means_per_mode = mean(omega_all,1,'omitnan');
stds_per_mode  = std(omega_all,0,1,'omitnan');
Mean_of_means = mean(means_per_mode);
Mean_std = mean(stds_per_mode);
Max_std = max(stds_per_mode);
CV_per_mode = 100 * stds_per_mode ./ means_per_mode;
Mean_CV = mean(CV_per_mode);

results.omega_all = omega_all;
results.Nsamples = Nsamples;
results.time_total = t_mc;
results.time_per_eval = time_per;
results.means_per_mode = means_per_mode;
results.stds_per_mode = stds_per_mode;
results.Mean_of_means = Mean_of_means;
results.Mean_std = Mean_std;
results.Max_std = Max_std;
results.CV_per_mode = CV_per_mode;
results.Mean_CV = Mean_CV;
end

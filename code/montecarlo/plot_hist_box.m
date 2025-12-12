function plot_hist_box(data)
figure; histogram(data,40); xlabel('f_1 (Hz)'); ylabel('counts'); title('MC distribution of f_1');
figure; boxplot(data); title('f_1 - Monte Carlo');
end

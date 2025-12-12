function results = MC_Ns(Ns, C, SelfStress, rhoarea, Nsamples, sigma, maxfrq)
rng(0)
omega = zeros(Nsamples,6);
t0 = tic;
parfor i = 1:Nsamples
    r = 1 + sigma.*randn(size(Ns));
    Ns_i = Ns .* r;
    [f, ~, ~] = SEM_vibration_generalAt(Ns_i, C, SelfStress, rhoarea, maxfrq);
    omega(i,:) = f(1:6)';
end
t_mc = toc(t0);
results = postprocess_mc(omega, Nsamples, t_mc);
plot_hist_box(omega(:,1))
end

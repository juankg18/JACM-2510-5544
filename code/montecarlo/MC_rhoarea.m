function results = MC_rhoarea(Ns, C, SelfStress, rhoarea, Nsamples, sigma, maxfrq)
rng(0)
omega = zeros(Nsamples,6);
t0 = tic;
parfor i = 1:Nsamples
    r = 1 + sigma.*randn(size(rhoarea));
    rhoarea_i = rhoarea .* r;
    [f, ~, ~] = SEM_vibration_generalAt(Ns, C, SelfStress, rhoarea_i, maxfrq);
    omega(i,:) = f(1:6)';
end
t_mc = toc(t0);
results = postprocess_mc(omega, Nsamples, t_mc);
plot_hist_box(omega(:,1))
end

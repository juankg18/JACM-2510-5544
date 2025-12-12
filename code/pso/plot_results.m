function plot_results(history)
figure;
plot(history.BestCost,'LineWidth',2)
xlabel('Iteration')
ylabel('Best Cost')
grid on
end

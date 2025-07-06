function snr_value = compute_snr(clean_signal, noisy_signal)
    noise_component = noisy_signal - clean_signal; % Estimate noise
    snr_value = 10 * log10(sum(clean_signal.^2) / sum(noise_component.^2));
end

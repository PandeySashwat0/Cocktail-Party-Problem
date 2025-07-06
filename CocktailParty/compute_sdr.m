function sdr_value = compute_sdr(clean_signal, processed_signal)
    distortion = clean_signal - processed_signal;
    sdr_value = 10 * log10(sum(clean_signal.^2) / sum(distortion.^2));
end

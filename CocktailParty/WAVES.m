% Convert Wideband Signal to Narrowband Using WAVES
numFreqBins = 50; % Choose number of frequency bins for transformation
narrowband_sigArray = zeros(NTSample, Nele, numFreqBins);

for k = 1:numFreqBins
    f_bin = fs * (k / numFreqBins); % Compute frequency bin
    % Ensure valid frequency range within Nyquist frequency
    low_cutoff = max(10, f_bin - 500); % Avoid very low frequencies (e.g., below 10 Hz)
    high_cutoff = min((fs/2) * 0.9, f_bin + 500); % Keep within Nyquist limit

    
    normalized_low = low_cutoff / (fs/2); % Normalize
    normalized_high = high_cutoff / (fs/2);
    
    [b, a] = butter(4, [normalized_low-1, normalized_high], 'bandpass');

    for m = 1:Nele
        filtered_signal = filter(b, a, sigArray(:, m)); % Apply filtering
        narrowband_sigArray(:, m, k) = filtered_signal(1:NTSample); % Trim to match original size

    end
end

% Compute the covariance matrix for each frequency bin
covMatrices = zeros(Nele, Nele, numFreqBins);
for k = 1:numFreqBins
    covMatrices(:, :, k) = (narrowband_sigArray(:, :, k)' * narrowband_sigArray(:, :, k)) / size(narrowband_sigArray, 1);
end

% Compute the final wideband covariance matrix (WAVES step)
R_wideband = mean(covMatrices, 3); % Average over frequency bins

% Perform MUSIC DOA Estimation
doaEstimator = phased.MUSICEstimator('SensorArray', uca, 'NumSignalsSource', 'Auto', ...
    'DOAOutputPort', true, 'ScanAngles', -90:0.5:90, 'CovarianceMatrixSource', 'Input port');

[~, estimatedAngles] = doaEstimator(R_wideband);
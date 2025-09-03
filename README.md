# Solution Overview

To resolve the problem of individual source extraction and identification in noisy environments the following solution has been implemented. 
- 20 Element Uniform Linear Array has been used

- 3 Sources of sound are used.
  
- Wideband to narrowband conversion has been done using WAVES method, since DOA algorithms work best with very narrowband signals. (100 fequency bins of 300Hz bandwidth)
  
- DOA Estimation is performed using MUSIC Algorithm
  
   ![Picture1](https://github.com/user-attachments/assets/d4ce38f8-3672-4012-846f-aacea1c174d3)
  
- Frost Beamforming done using angles of arrival estimated by MUSIC
  
  ![Picture2](https://github.com/user-attachments/assets/650fb873-62d2-40b1-9a18-b2cd05c878cf)
  
  ![Picture3](https://github.com/user-attachments/assets/9c8b99aa-3eb9-4490-bba9-276e0bb9f250)
  
- Denoising done using Wiener Filtering

  ![Picture4](https://github.com/user-attachments/assets/ce1124f6-0ee5-4f39-a586-0442f3f08ab1)
  
  ![Picture5](https://github.com/user-attachments/assets/ea3f921a-7db1-40b8-870a-3c1c36eae9a6)

- ICA has been used for unmixing the signals

- MFCCs have been extracted for speaker classification

  ![Picture6](https://github.com/user-attachments/assets/5fe289aa-1f53-4ae1-b265-084743a57c24)

  ![Picture7](https://github.com/user-attachments/assets/6b931320-d6ea-47f1-bdba-23e0f7812ae0)

- Effective SDR reduction is observed in each of the sources.

| Source | SDR Before (dB) | SDR After (dB) |
|--------|-----------------|----------------|
| 1      | -0.33306        | -0.095596      |
| 2      | -6.1375         | -2.7987        |
| 3      | -2.9386         | -1.12156       |


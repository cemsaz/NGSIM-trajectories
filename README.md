This repository contains MATLAB code to process New Generation SIMulation (NGSIM) Interstate 80 (I-80) vehicle trajectory dataset and extract leader-follower vehicle trajectory pairs. These pairs can be used to analyze driving behaviors and build car following models. Lane change situtaions are removed. https://www.fhwa.dot.gov/publications/research/operations/06137/

Steps:
- Download the data from NGSIM website. Go to https://www.its-rde.net/index.php/data/searchdata Create an account and search for the data I-80. Download the vehicle trajectory data. RECONSTRUCTED trajectories-400-0415_NO MOTORCYCLES.csv is used in this project. 
- After getting the csv file, add it under the project folder and run saveNGSIMdata.m 
- Run main.m which contains an example that plots trajectory pair 1 on lane 2. ![untitled](https://cloud.githubusercontent.com/assets/11336887/22189182/0a3f7d22-e0e9-11e6-880f-035df4281a9c.png)

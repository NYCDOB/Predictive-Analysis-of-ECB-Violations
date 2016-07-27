# Predictive-Analysis-of-ECB-Violations

Predictive analysis on 5 years of DOB ECB Violations, 2010-2015. Methods included market basket and social network analysis. The project research goals and results are in the above memo. The Ipython notebook is used for data cleaning and creating output to interpret the data, the R script is for market basket modelling.

#Market Basket Analysis
The analysis produced over 200 association rules, below are two that were most useful:

Rule 1: Confidence: 0.92 Support: 0.00347 
155: FAIL MAINTAIN BLDG IN COMPLIANT MANNER:LACK OF AUTOMATIC SPRINKLERS
189: FAIL TO MAIMTAIN REQUIRED NUMBER OF MEANS OF EGRESS FOR EVERY FLOOR
=>106k:ILLEGAL ACTIVITY

Rule 2: Confidence: 0.91 Support: 0.0065 
105: 1OR2 FAMILY CONVERTED/MAINTAINED AS DWELLING FOR 4 OR MORE FAMILIES
187: UNLAWFUL ACTS.FAILURE TO COMPLY WITH AN ORDER OF THE COMMISSIONER
=>101: WORK WITHOUT A PERMIT

Rule 1 states that a failure to maintain automatic sprinklers and an egress for every door predicts illegal activity. This rule has an accuracy of 92% and frequency of 0.347%. Rule 2 states that the conversion of a 1 or 2 family home and unlawful acts predicts work without a permit. 



#Social Network Analysis

The below graphs shows the network with edge thickness displayed and a cluster related to safety for January 2015. The January results show strong ties between 4 pairs of violations, these pairs of violations have very thick edge widths.


![alt tag](https://cloud.githubusercontent.com/assets/11237613/17185540/7f5db1f4-53ff-11e6-9ca6-8516da6e82bc.png)


Three clusters can be identified in the network – two toward the left and one in the center. 

![alt tag](https://cloud.githubusercontent.com/assets/11237613/17186089/c608a198-5401-11e6-8f2b-2d7beeb1426a.png)

The cluster pictured below is a sub-cluster of the center cluster and is of interest because it is related to safety. It is composed of violations 210: Failure to Provide Documents at Construction Site, 115: Failure to Maintain Safety Equipment, 182: Work Not Conforming to Documents, 109: Failure to Safeguard Persons and 181: Failure to Maintain Housekeeping. 

![alt tag](https://cloud.githubusercontent.com/assets/11237613/17185549/85dc6ebc-53ff-11e6-9690-41d62e1edaf5.png)




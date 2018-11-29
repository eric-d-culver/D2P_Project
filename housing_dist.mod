set TYPES; # types of housing

param budget >= 0;
param land >= 0;

param profit {TYPES} >= 0;
param cost {TYPES} >= 0;
param size {TYPES} >= 0;
param demand {TYPES} >= 0;

var build {t in TYPES} >= 0, <= demand[t];

maximize Total_Profit:
   sum {t in TYPES} profit[t]*build[t];

subject to Under_Budget:
   sum {t in TYPES} cost[t]*build[t] <= budget;
   
subject to Land_Avail:
   sum {t in TYPES} size[t]*build[t] <= land;
   
#Data Dictionary

Chlorophyll and Cynaobacteria values were measured in Raw Fluorescence Units (RFU). These data
were converted to concentrations using a calibration curve (in the outdata folder).

- For chlorophyll, $[conc] = (0.0054\cdot[RFU]) + 0.123$
- For cyanobacteria, $[conc] = (1.90\cdot[RFU]) - 0.08$

Note that for the cyanobacteria curve, this was not specific to our instrument and thus
calculated concentrations should only be interpreted for relative changes.
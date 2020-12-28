# Alpine 7909 DC/DC converter
An improved DC/DC converter design for Alpine 7909.

Uses a Traco 6W converter to get symmetric +/-12V and then ultralow noise, ultrahigh PSRR linear regulators (LT3045, LT3094) to regulate the voltages down to +/-10V.

The board is smaller than the original and fits nicely into the space available.

**Warning** The PCBs have not been tested as of now, use at your own risk.

## 3D view

![3D render](/pictures/dcdc_7909_3d_thumb.png)

## Component list

Most components specific to this are contained in the [CSV file](digikey_bom.csv). Please note that it does not contain components I had already at hand, so double check it against the schematic.

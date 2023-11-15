rds_onh = 0.975
rds_onl = 0.443

rdcr_typ = 0.4

vin_min = 11.5
vout = -10.5

dmax_typ = (abs(vout) + 0.5 * (rdcr_typ + rds_onl)) / (vin_min + abs(vout) - 0.5 * (rds_onh - rds_onl))

fsw = 400 * 1000

% min voltage
t_off_min_max = 160e-9
rdcr_max = 1 % ohm
rds_onl_max = 0.88
rds_onh_max =  1.95
dmax = 1 - t_off_min_max * fsw
vin_min_calc = (abs(vout) * (1 - dmax))/dmax + 0.5/dmax * (rdcr_max + (1-dmax) * rds_onl_max + dmax * rds_onh_max)

% inductor
l = abs(vout) * 2.5 / fsw

% max load current
iout_max = 0.5 * (1 - (abs(vout) + 0.5*(rdcr_max + rds_onl_max)) / (vin_min + abs(vout) - 0.5*(rds_onh_max - rds_onl_max)))

iout = 0.07
frhpz = (abs(vout) * (1-dmax_typ)^2) / (2 * pi * l * dmax_typ * iout)
fc = min(min(frhpz / 4, fsw / 4), 50000)

% output capacitor selection
t_response = 0.35 / fc
delta_vout = 0.040
i_step = 0.01
cout_calc = 0.5*(i_step * t_response) / delta_vout
cout = 0.000022

% soft start 
css_min = 139e-6 * cout_calc * abs(vout)
css = 10e-9
tss = css / 5.55e-6

rfb_top = (36.8*(1-dmax_typ)) / (fc * cout_calc)
rfb_bot = (rfb_top * 0.9)/(abs(vout) - 0.9)

rfb_top_real = 390 + 27
rfb_bot_real = 39

vout_real = (rfb_top_real * 0.9) / rfb_bot_real + 0.9


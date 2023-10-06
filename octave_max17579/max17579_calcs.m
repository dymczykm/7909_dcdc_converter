rds_onh = 0.975
rds_onl = 0.443

rdcr_typ = 0.2

vin_min = 11
vout = -10.5

dmax_typ = (abs(vout) + 0.5 * (rdcr_typ + rds_onl)) / (vin_min + abs(vout) - 0.5 * (rds_onh - rds_onl))

cout = 0.000022


fsw = 400000

l = abs(vout) * 2.5 / fsw


iout = 0.07
frhpz = (abs(vout) * (1-dmax_typ)^2) / (2 * pi * l * dmax_typ * iout)

fc = min(min(frhpz / 4, fsw / 4), 50000)

rfb_top = (36.8*(1-dmax_typ)) / (fc * cout)

rfb_bot = (rfb_top * 0.9)/(abs(vout) - 0.9)

rfb_top_real = 19.1

rfb_bot_real = 1.78

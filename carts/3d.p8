pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
cls()

y_gap=8
y_start=128/3
y_lines=(128/y_gap)-(y_start/y_gap)

for i=y_start,y_lines*y_gap,y_gap do
	line(0,i,128,i,11)
end

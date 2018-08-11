pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
-- range
function rndr(a,b) -- min,max
 if (a>b) a,b=b,a -- sanity check
		return a+rnd(b-a)
end

-- around a value
function rnda(c,r) -- center, radius
 r=abs(r) -- sanity check
 return c-r+rnd(2*r)
end

-- set values for cir
c={}
instcir=100*3
for i=1,instcir,3 do
	c[i+2]=rndr(1,13)
	if i<=instcir/4 then
		c[i]=rndr(0,84)
		c[i+1]=rndr(0,42)
	end
	if i>instcir/4 and i<=instcir/2 then
		c[i]=rndr(84,128)
		c[i+1]=rndr(0,84)
	end
	if i>instcir/2 and i<=instcir*0.75 then
		c[i]=rndr(42,128)
		c[i+1]=rndr(84,128)
	end
	if i>instcir*0.75 then
		c[i]=rndr(0,42)
		c[i+1]=rndr(42,128)
	end
end

function _init()
	cls()
end

function _update()
end

function _draw()
	cls()
	fillp()
	rectfill(0,0,127,127,10)
	fillp(23130.5)
	for i=1,instcir,3 do
		circfill
		(c[i],c[i+1],c[i+2],9)
		c[i+2]+=.3 --increase radius
		if c[i+2]>13 then
 		if i<=instcir/4 then
		c[i]=rndr(0,84)
		c[i+1]=rndr(0,42)
	end
	if i>instcir/4 and i<=instcir/2 then
		c[i]=rndr(84,128)
		c[i+1]=rndr(0,84)
	end
	if i>instcir/2 and i<=instcir*0.75 then
		c[i]=rndr(42,128)
		c[i+1]=rndr(84,128)
	end
	if i>instcir*0.75 then
		c[i]=rndr(0,42)
		c[i+1]=rndr(42,128)
	end
  	c[i+2]=rndr(1,2)
		end
	end
end
__gfx__
00999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
099aa990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99aaaa99000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99aaaa99000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
099aa990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
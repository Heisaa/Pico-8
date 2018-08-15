pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
--my library
function round(num)
 if num-flr(num)<0.5 then
  return flr(num)
 else
  return ceil(num)
 end
end

function maprange(x,a,b,c,d)
 y=(x-a)*((d-c)/(b-a)) + c
 return round(y)
end
--end of my library

--variables
timer=0
cavemax=8 --change this to change cavesize
cavemin=cavemax-4
cavecol=0
cavespawn=30
cavespeed=1.04
cavex=64
cavey=64
alldots={}

function makedots()
 dots={}
 amount=round(rnd(5))+6
 for i=0,1-1/amount,1/amount do
  add(dots,{
      sin(i)*(rnd(cavemax-cavemin)+cavemin)+cavex,
      cos(i)*(rnd(cavemax-cavemin)+cavemin)+cavey
      })
 end
 --save the dots in an array
 add(alldots,dots)
 if #alldots>5 then
  del(alldots,alldots[1])
 end
end

function cave(arr)
 --draw the cave from coordinats
 for i=1,#arr do
  if i==#arr then
   line(arr[i][1],arr[i][2],arr[1][1],arr[1][2],cavecol)
  else
   line(arr[i][1],arr[i][2],arr[i+1][1],arr[i+1][2],cavecol)
  end
 end
end

function growcave(arr)
 local checkamount=0
 for i=1,#arr do
  arr[i][1]=sin(checkamount)*((arr[i][1]-cavex)/sin(checkamount))*cavespeed+cavex --calculating the random cavesize and grow it
  arr[i][2]=cos(checkamount)*((arr[i][2]-cavey)/cos(checkamount))*cavespeed+cavey
  checkamount+=1/#arr
 end
end

--Testing
function extractv(arr)
 res={}
 for i=1,#arr do
  add(res,arr[i][1])
  add(res,arr[i][2])
 end
 return res
end

function render_poly(v,col)
 col=col or 5

 -- initialize scan extents
 -- with ludicrous values
 local x1,x2={},{}
 for y=0,127 do
  x1[y],x2[y]=128,-1
 end
 local y1,y2=128,-1

 -- scan convert each pair
 -- of vertices
 for i=1, #v/2 do
  local next=i+1
  if (next>#v/2) next=1

  -- alias verts from array
  local vx1=flr(v[i*2-1])
  local vy1=flr(v[i*2])
  local vx2=flr(v[next*2-1])
  local vy2=flr(v[next*2])

  if vy1>vy2 then
   -- swap verts
   local tempx,tempy=vx1,vy1
   vx1,vy1=vx2,vy2
   vx2,vy2=tempx,tempy
  end 

  -- skip horizontal edges and
  -- offscreen polys
  if vy1~=vy2 and vy1<128 and
   vy2>=0 then

   -- clip edge to screen bounds
   if vy1<0 then
    vx1=(0-vy1)*(vx2-vx1)/(vy2-vy1)+vx1
    vy1=0
   end
   if vy2>127 then
    vx2=(127-vy1)*(vx2-vx1)/(vy2-vy1)+vx1
    vy2=127
   end

   -- iterate horizontal scans
   for y=vy1,vy2 do
    if (y<y1) y1=y
    if (y>y2) y2=y

    -- calculate the x coord for
    -- this y coord using math!
    x=(y-vy1)*(vx2-vx1)/(vy2-vy1)+vx1

    if (x<x1[y]) x1[y]=x
    if (x>x2[y]) x2[y]=x
   end 
  end
 end

 -- render scans
 for y=y1,y2 do
  local sx1=flr(max(0,x1[y]))
  local sx2=flr(min(127,x2[y]))

  local c=col*16+col
  local ofs1=flr((sx1+1)/2)
  local ofs2=flr((sx2+1)/2)
  memset(0x6000+(y*64)+ofs1,c,ofs2-ofs1)
  pset(sx1,y,c)
  pset(sx2,y,c)
 end 
end

--end testing

--game loop
function _init()
 cls()
 makedots()
end

function _update()
 if timer==cavespawn then
  makedots()
  timer=0
  end
 timer+=1
 for i=1,#alldots-1 do
  growcave(alldots[i])
 end
 if btn(1) then
  cavex+=1
 elseif btn(0) then
  cavex-=1
 elseif btn(3) then
  cavey+=1
 elseif btn(2) then
  cavey-=1
 end

end

function _draw()
 cls(5)
 
 for i=1,#alldots do
  cave(alldots[i])
 end
 render_poly(extractv(alldots[#alldots]),0)
 
 
 --debug
 --print("alldots:"..#alldots,3,100,7)
 print("mem:"..round(stat(0)).."kib",3,113,7)
 print("cpu:"..round(stat(2)*100).."%",3,121,7)
end


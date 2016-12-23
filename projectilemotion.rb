#this library is located at
#https://github.com/mkrobert/ruby_projectilemotion

include Math
#required kinematics library, kinematics.rb, is located at
#https://github.com/mkrobert/ruby_kinematics
require './kinematics'

class ProjectileMotion < Kinematics
  def findVIX(x,y,h,th)
    if (x[0] != nil)
      return x
    elsif (th != nil) && (h[0] != nil)
      return h[0] * cos(th * PI / 180.0)
      return sqrt((h[0] ** 2) - (y[0] ** 2))
    end
  end

  def findVIY(x,y,h,th)
    if (y[0] != nil)
      return y
    elsif (th != nil) && (h[0] != nil)
      return h[0] * sin(th * PI / 180.0)
    else
      return sqrt((h[0] ** 2) - (x[0] ** 2))
    end
  end

  def findVIH(x,y,h,th)
    if (h[0] != nil)
      return h
    elsif (th != nil) && (x[0] != nil)
      return x[0] * tan(th * PI / 180.0)
    else 
      return sqrt((x[0] ** 2) + (y[0] ** 2))
    end
  end

  def findTh(x,y,h,th)
    if (th != nil)
      return th
    else
      return atan(findVIY(x,y,h,th,t) / findVIX(x,y,h,th) * PI / 180.0)
    end
  end

  def findDeltaX(x,y,h,th)
    if (x[3] != nil)
      return x[3]
    elsif (y[0] != nil) && (y[2] != nil) && (y[3] != nil)
      return x[0] * (findT(y[0],y[1],y[2],y[3],y[4]))
    else
      return "unexpected findDeltaX result"
    end
  end

end

#implementation example
#A water balloon is thrown horizontally with a speed of 8.31m/s from the roof of a building of height 23.0m. 
#How far does the balloon travel horizontally before striking the ground?
promot = ProjectileMotion.new
puts promot.findDeltaX([8.31,nil,nil,nil,nil],[0,nil,-9.8,-23.0,nil],nil,nil).to_s

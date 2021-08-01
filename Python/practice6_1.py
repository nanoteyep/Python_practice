#practcing class

class Point:
    def __init__(self,x,y):
        self.x = x
        self.y = y
    #this class needs x and y

    def setx(self,x):
        self.x = x
    #you can also get x in this method
    def sety(self,y):
        self.y = y
    #you can also get y in this method

    def get(self):
        coordinate = (self.x,self.y)
        print(coordinate)
    #print coordinate

    def move(self,dx,dy):
        self.x = self.x + dx
        self.y = self.y + dy
    #move coordinate as much as dx,dy
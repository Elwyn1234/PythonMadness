from tkinter import *

class Root(Tk):
    def __init__(self):
        super(Root, self).__init__()

        self.title("helloTkinter")
        self.minsize(500, 500)

root = Root()
root.mainloop()

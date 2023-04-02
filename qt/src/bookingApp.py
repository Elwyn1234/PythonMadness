import sys
from typing import Any, Optional, Union
from PySide6.QtCore import QAbstractListModel, QModelIndex, QObject, QPersistentModelIndex, QStringListModel, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtWidgets import QGridLayout, QLayout, QListView, QTextEdit

import os
import re
import sqlite3
from dataclasses import dataclass

def totalPrice(days, accomodation):
    accomodationPrices={
        "Paradise Villa": 37000,
        "Sunshine Hut": 28000,
        "Standard Cabin": 20000,
        "Treehouse": 16000,
        "Classic Tipi": 12000,
    }
    cardFee={
        "Paradise Villa": 400,
        "Sunshine Hut": 350,
        "Standard Cabin": 300,
        "Treehouse": 250,
        "Classic Tipi": 200,
    }
    # discounts and vat is the number of five percents 
    discounts={
        "Paradise Villa": 2,
        "Sunshine Hut": 2,
        "Standard Cabin": 1,
        "Treehouse": 1,
        "Classic Tipi": 1,
    }
    vat = 3

    subtotal = accomodationPrices.get(accomodation) * days + cardFee.get(accomodation)
    fivePercent = subtotal / 20 # This will sometimes return a float
    total = subtotal - (fivePercent * discounts.get(accomodation)) + (fivePercent * vat) 
    # We want to return an int (number of pennies) and we want to round down by casting because we are kind :)
    return int(total)

@dataclass
class LoginDetails:
    username: str
    password: str

class BookingList(QAbstractListModel):
    def __init__(self, parent: Optional[QObject] = ...) -> None:
        self.myData = [
            {
                "firstName": "model data",
                "surname": "surname from model data",
            },
            {
                "firstName": "model data",
                "surname": "surname from model data",
            },
            {
                "firstName": "model data",
                "surname": "surname from model data",
            },
        ]
    def data(self, index: Union[QModelIndex, QPersistentModelIndex], role: int = ...) -> Any:
        return self.myData
    def rowCount(self, parent: Union[QModelIndex, QPersistentModelIndex] = ...) -> int:
        return 10;

class App(QObject):
    def __init__(self):
        QObject.__init__(self)

        self.user = LoginDetails("", "")
        mainAbsPath = os.path.dirname(os.path.abspath(__file__))
        rootAbsPath = re.sub(".src$", "", mainAbsPath)
        self.dbLocation = rootAbsPath + "/bookingApp.db"
        self.qtApp = QGuiApplication(sys.argv)

        # Init engine
        mainQmlAbsPath = os.path.join(rootAbsPath, "src/views/main.qml")
        # if engine is not stored as a member variable then no window is displayed (maybe due to garbage collection?!)
        self.engine = QQmlApplicationEngine()
        self.engine.load(mainQmlAbsPath)
        self.appWindow = self.engine.rootObjects()[0]
        self.engine.rootContext().setContextProperty("handler", self)

    @Slot(str, str, str)
    def book(self, date, days, accomodation):
        con = sqlite3.connect(self.dbLocation)
        cursor = con.cursor()
        cursor.execute(
            '''INSERT INTO bookings VALUES (?,?,?,?,?)''', (
            self.user.username,
            date,
            days,
            accomodation,
            totalPrice(int(days), accomodation)
        ))
        con.commit()
        con.close()
        
        app.appWindow.setProperty("currentView", "login.qml")

    @Slot(str, str)
    def userLogin(self, username, password):
        con = sqlite3.connect(self.dbLocation)
        cursor = con.cursor()
        cursor.execute(
            '''SELECT username, password FROM users WHERE username = ?''', (username,))
        user = cursor.fetchall()
        con.close()

        if len(user) == 1:
            actualPassword = user[0][1]
            if password == actualPassword:
                self.user = LoginDetails(user[0][0], user[0][1])
                app.appWindow.setProperty("currentView", "booking.qml")
                return

    @Slot()
    def displayRegistration(self):
        app.appWindow.setProperty("currentView", "register.qml")

    @Slot(str, str)
    def adminLogin(self, username, password):
        con = sqlite3.connect(self.dbLocation)
        cursor = con.cursor()
        cursor.execute('''SELECT username, password FROM admins WHERE username = ?''', (username,))
        user = cursor.fetchall()
        con.close()

        if len(user) == 1:
            actualPassword = user[0][1]
            if password == actualPassword:
                # bookingListModel = BookingList()
                # app.appWindow.setProperty("myModel", bookingListModel)
                # app.appWindow.setProperty("currentView", "admin.qml")
                # print(app.appWindow.findChild(QGridLayout, "admin")) # .addWidget(QTextEdit("elloFrom py"), 1, 0)
                con = sqlite3.connect(self.dbLocation)
                cursor = con.cursor()
                cursor.execute('''SELECT * FROM bookings''')
                bookings = cursor.fetchall()
                con.close()

                print(bookings)


    @Slot()
    def displayRegistration(self):
        app.appWindow.setProperty("currentView", "register.qml")

    @Slot()
    def displayHome(self):
        app.appWindow.setProperty("currentView", "login.qml")

# TODO: verify all inputs and only enable submit button to be pressed once all inputs are valid. Therefore, do not validate input in register function.
    @Slot(str, str, str, str, str)
    def register(self, username, password, firstName, lastName, email): 
        con = sqlite3.connect(self.dbLocation)
        cursor = con.cursor()
        cursor.execute(
            '''INSERT INTO users VALUES (?,?,?,?,?)''', (
            username,
            password,
            firstName,
            lastName,
            email
        ))
        con.commit()
        con.close()
        
        app.appWindow.setProperty("currentView", "login.qml")



if __name__ == "__main__":
    app = App()
    sys.exit(app.qtApp.exec())



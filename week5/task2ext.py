usernames = open("task2ext.txt", "r").read().split()
print(usernames)
newUser = input("Add a new user: ")
open("task2ext.txt", "a").write(newUser + "\n")

import os


os.popen("git add .")
msg = input()
os.popen("git commit -m msg")
os.popen("git push")

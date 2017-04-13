import os
os.popen("git add .")
#print "请输入message:"
msg = input()
os.popen("git commit -m msg")
os.popen("git push")

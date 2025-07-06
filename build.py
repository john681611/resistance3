from shutil import rmtree, copytree
from os import listdir, getcwd
rmtree(getcwd()+ '/built')
print('removing built')
for f in listdir('./maps'):
    map = (getcwd()+'/maps/'+f)
    built = (getcwd()+'/built/co_36_resistance3-10-0'+f)
    commonFile = (getcwd()+'/common')
    copytree(commonFile, built, dirs_exist_ok = True)
    copytree(map, built, dirs_exist_ok = True)
    print('built:'+ built)
print('done!')
    

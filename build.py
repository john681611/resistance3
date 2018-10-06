from shutil import rmtree
from distutils.dir_util import copy_tree
from os import listdir, getcwd
rmtree(getcwd()+ '\\built')
print('removing built')
for f in listdir('./maps'):
    map = (getcwd()+'\\maps\\'+f)
    built = (getcwd()+'\\built\\co_36_resistance3'+f)
    copy_tree(map, built)
    commonFile = (getcwd()+'\\common')
    copy_tree(commonFile, built)
    print('built:'+ built)
print('done!')
    

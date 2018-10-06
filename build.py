import os
import shutil

def prep(file):
        if os.path.isdir('PrepFolder\co_36_resistance3.'+file):
                shutil.rmtree('PrepFolder\co_36_resistance3.'+file) 
        shutil.copytree('co_36_resistance3.'+file, 'PrepFolder\co_36_resistance3.'+file)

prep('Altis')
prep('Malden')
prep('Tanoa')
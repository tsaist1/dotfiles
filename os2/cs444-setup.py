#!/usr/bin/python2

import argparse
import os
import shutil
import subprocess

HOME = os.getenv("HOME")
CS444_BASE = "%s/.cs444" % HOME

def ask_intent(string):
    answer = 'z'
    while (answer != 'y' and answer != 'n'):
        print(string + " (y/n) ?")
        answer = raw_input().strip().lower()

    return answer == 'y'

def backup_and_write_file(fn, data):
    # backup file
    if os.path.exists(fn):
        for i in range(1000):
            # fn.bak.[number] is backup
            backup_fn = '%s.bak.%d' % (fn, i)
            if not os.path.exists(backup_fn):
                shutil.copyfile(fn, backup_fn)
            break
    with open(fn, 'w') as f:
        f.write(data)

def clone():
    os.system('git config --global core.autocrlf false')
    if os.path.exists(CS444_BASE):
        os.system("rm -rf %s" % CS444_BASE)
    try:
        r = os.system('git clone https://github.com/blue9057/peda %s' % CS444_BASE)
    except:
        print("Cloning cs444 git repository has failed!")
        return

    if r != 0:
        print("Cloning cs444 git repository has failed!")
        return

def install_gdb():
    if not ask_intent("Do you want to install peda to ~/.gdbinit"):
        return
    with open("%s/gdbinit" % CS444_BASE,'rb') as f:
        gdbinit = f.read()
    backup_and_write_file('%s/.gdbinit' % HOME, gdbinit)

def install_bash():
    if not ask_intent("Do you want to install .bashrc"):
        return

    with open("%s/bashrc" % CS444_BASE,'rb') as f:
        bashrc = f.read()
    backup_and_write_file('%s/.bashrc' % HOME, bashrc)

    cshrc = None
    with open("%s/.cshrc" % HOME, 'rb') as f:
        cshrc = f.read()
        if not 'exec /bin/bash' in cshrc:
            cshrc += "\nexec /bin/bash\n"
    if cshrc != None:
        backup_and_write_file('%s/.cshrc' % HOME, cshrc)

def install_vim():
    if not ask_intent("Do you want to install .vimrc and vim plugins"):
        return

    with open("%s/vimrc" % CS444_BASE, 'rb') as f:
        vimrc = f.read()
    backup_and_write_file('%s/.vimrc' % HOME, vimrc)

    os.system("vim +PlugInstall +qall")

def install_tmux():
    if not ask_intent("Do you want to install cs444 custom tmux configuration"):
        return

    with open("%s/tmux.conf" % CS444_BASE, 'rb') as f:
        tmux_conf = f.read()
    backup_and_write_file('%s/.tmux.conf' % HOME, tmux_conf)

def copy_qemu():
    copy_file_to_bin('qemu-system-i386')
    copy_file_to_bin('kill-qemu')
    copy_file_to_bin('kill-all-tmux')
    copy_file_to_bin('ta-help')

def copy_file_to_bin(name):
    if not os.path.exists("%s/bin" % HOME):
        os.makedirs("%s/bin" % HOME)

    shutil.copyfile("%s/bin/%s" % (CS444_BASE, name),
            "%s/bin/%s" % (HOME, name))
    os.system("chmod +x %s/bin/%s" % (HOME, name))


def main():
    clone()
    copy_qemu()
    print('')
    print('')
    install_gdb()
    install_tmux()
    install_bash()
    install_vim()

if __name__ == '__main__':
    main()

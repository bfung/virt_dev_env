# Virtualized Development Environment

Current setup assumes development on macOS.
Creates a FreeBSD environment for development.

## Prerequisites

*  Homebrew [here](https://docs.brew.sh/Installation)
*  VirtualBox

        $ brew cask install virtualbox

*  Vagrant

        $ brew cask install vagrant

## Usage

Before running `vagrant up`, there are some manual steps.
Copying credentials and keys into the ansible directory is necessary as the
ansible_local provisioner cannot read/access symlinks in the shared folder.

These credential files are listed in .gitignore - DON'T EXPOSE THEM TO OTHERS!

### Setup 

Copy your private key in order to access github!

    $ cp ~/.ssh/id_rsa ansible/roles/common/files/id_rsa
    $ chmod 644 ansible/roles/common/files/id_rsa

AWS files

    $ cp ~/.aws/config ansible/roles/common/files/config
    $ cp ~/.aws/credentials ansible/roles/common/files/credentials

### Running

After putting personal files in those locations,

    $ vagrant up

This should create a FreeBSD box and provision it using ansible_local.
If the box already exists, changes made to ansible/site.yml can be applied:

    $ vagrant provision 

Finally, `vagrant ssh` into the VM.  `git clone` should work as should `stack`.

### TODO

#### .aws-key file
For now, copy .aws-key file manually into the guest VM's /home/vagrant directory.
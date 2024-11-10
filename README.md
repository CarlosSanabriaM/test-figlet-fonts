# Test Figlet fonts

This project contains a bash script that downloads and tests a bunch of fonts from the [figlet-fonts](https://github.com/xero/figlet-fonts) project.

## Prerequisites

* [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Install Vagrant](https://www.vagrantup.com/docs/installation)

### Verify installation

> [!NOTE]  
> Execute these steps only if it's the first time that you use Vagrant with VirtualBox.  
> If not, you can skip them. They only serve to test the Vagrant + VirtualBox installation.  
> If Vagrant and VirtualBox are installed and configured correctly,
> then the environment will work fine (it has already been tested, and is repeatable).

Check that the `vagrant` executable was added correctly to the `PATH` variable:
```bash
vagrant version
```

Check that vagrant is able to create a VM:
```bash
mkdir test-vagrant
cd test-vagrant
vagrant init ubuntu/jammy64
vagrant up
vagrant ssh
pwd
exit
vagrant destroy --force
cd ..
rm -rf test-vagrant
```

> [!WARNING]  
> If the following error appears after executing `vagrant up`:  
> __`No usable default provider could be found for your system.`__
>
> 1. Verify that VirtualBox was installed correctly
> 2. Obtain more info about the error:
     >    ```
     >    vagrant up --provider=virtualbox
     >    ```

> [!WARNING]  
> If the following error appears after executing `vagrant up`:  
> __`VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005)`__
>
> * Reinstall VirtualBox

> [!WARNING]  
> If Vagrant gets stuck on the following line after executing `vagrant up`:  
> __`SSH auth method: private key`__
>
> * Windows users: Open cmd as admin and execute:
    >    ```
    >    bcdedit /set hypervisorlaunchtype off
    >    ```
    >   This disables [Hyper-V](https://es.wikipedia.org/wiki/Hyper-V).

> [!WARNING]  
> For __other issues__:
>
> * Visit the [VirtualBox Common Issues](https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/common-issues) section of the Vagrant documentation

## Customize the script

All these changes must be done in the [test-figlet-fonts.sh](scripts/test-figlet-fonts.sh) script.

### Text

You can customize the text that will be displayed by changing the `TEXT` variable:
```bash
TEXT="Vagrant VM"
```

### Fonts

You can change the fonts that will be displayed by changing the `FONTS` variable:
```bash
declare -a FONTS=(
    # Array of strings, where each string has 2 values inside, separated using the " | " characters:
    #   "<font-name> | <font-url-suffix>"
    # An associative array cannot be used because it does not keep order

    # xx-large
    "##### xx-large ##### | ##### xx-large #####" # font-size section heading
    "Alpha.flf | Alpha.flf"
    "Doh.flf | Doh.flf"
    
    # ...
)
```

You can remove or add fonts. Fonts can be found at: https://github.com/xero/figlet-fonts

### Color

You can change the color of the text by commenting/uncommenting the following lines:

```bash
# Uncomment one of the following lines to print with or without rainbow color (or uncomment both =P)
# figlet -f "/usr/share/figlet/fonts/$font" -t "$TEXT" # print with default color
figlet -f "/usr/share/figlet/fonts/$font" -t "$TEXT" | lolcat --spread 1.5 --force # print with rainbow color
```

The 1st line prints the text with the default color, whereas the 2nd line prints the text with a rainbow color.

You can also change the `--spread` value to change the color spread.

## Steps to run the environment

All the `vagrant` commands must be executed in the host machine from the folder
that contains the Vagrantfile (in this case, the project root folder).

> [!NOTE]  
> __For Windows users:__  
> If Vagrant doesn't show any output in the stdout for a Vagrant command after some time,
> press the Enter key or right click in the console window.
> See [this post](https://superuser.com/questions/1442941/windows-10-console-stops-running-if-i-click-in-the-console-window) for more info about this problem.

### 1. Start the VM [host]

```bash
vagrant up
```

This will also execute the following scripts:
* [configure-profile-file.sh](scripts/vagrant/configure-profile-file.sh):
  Configures the VM to execute the `test-figlet-fonts.sh` script upon `vagrant ssh`
* [install-tools.sh](scripts/vagrant/install-tools.sh):
  Installs `figlet`, `lolcat` and other tools

### 2. Check the status of the VM [host]

```bash
vagrant status
```

### 3. Connect to the VM [host]

This connection is done via SSH.

```bash
vagrant ssh
```

This will execute the [test-figlet-fonts.sh](scripts/test-figlet-fonts.sh) script,
that downloads the specified fonts and displays the text message in the terminal using each font.

### 4. Exit the VM [vm]

```bash
Ctrl-D
```

### 5. Stop the VM [host]

```bash
vagrant halt
```

### 6. Destroy the VM [host]

```bash
vagrant destroy
```

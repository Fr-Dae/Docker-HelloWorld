#!/bin/bash

# Déterminer le terminal par défaut
case "$XDG_CURRENT_DESKTOP" in
    LXDE)
        TERMINAL=lxterminal
        ;;
    LXQt)
        TERMINAL=lxqt-terminal
        ;;
    GNOME)
        TERMINAL=gnome-terminal
        ;;
    *)
        # Vérifier si nous sommes sur Windows
        if [[ "$OS" == "Windows_NT" ]]; then
            TERMINAL=powershell.exe # ou cmd.exe selon ce que vous préférez
            ICON_PATH="C:/Windows/System32/cmd.exe.ico" # Remplacer par le chemin d'une icône MS-DOS
            DESKTOP_FILE="$HOME/Desktop/HelloWorld.lnk"

            # Créer un raccourci sur le bureau Windows
            echo "Creating Windows shortcut..."
            # Utiliser PowerShell pour créer le raccourci
            powershell.exe -Command "
            $ws = New-Object -ComObject WScript.Shell;
            $shortcut = $ws.CreateShortcut('$DESKTOP_FILE');
            $shortcut.TargetPath = 'docker';
            $shortcut.Arguments = 'run --rm hello-world-app';
            $shortcut.IconLocation = '$ICON_PATH';
            $shortcut.Save()
            "

            exit 0  # Sortir après la création du raccourci
        else
            TERMINAL=xterm  # Terminal par défaut si non reconnu
            ICON_PATH="/usr/share/icons/gnome/48x48/apps/utilities-terminal.png"
        fi
        ;;
esac

# Créer le fichier .desktop
DESKTOP_FILE="$PWD/HelloWorld.desktop"

echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Hello World
Exec=$TERMINAL -e 'docker run --rm hello-world-app'
Icon=$ICON_PATH
Terminal=false" > "$DESKTOP_FILE"

# Rendre le fichier exécutable
chmod +x "$DESKTOP_FILE"

# Lancer l'application Docker dans le terminal
$TERMINAL -e 'docker run --rm hello-world-app'

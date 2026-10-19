<div align="center">

# NixOS-Private - Additional Requirements for the NixOS-Public Configuration

![NixOS](https://img.shields.io/badge/NixOS-Stable-blue)
![Flakes](https://img.shields.io/badge/Nix-Flakes-informational)
![License: MIT](https://img.shields.io/badge/License-MIT-green)

*The few files contained here are so you can keep your personal information private.*

</div>

## Structure

```text
syste_files
├── public/                            # Publicly available information
│   ├── .git/
│   ├── flake.nix                      # Inputs + outputs
│   ├── flake.lock                     # Pinned dependency versions
│   ├── system/
│   │   ├── configuration.nix          # System-wide config
│   │   ├── hardware-configuration.nix # Machine hardware-specific config
│   │   └── modules/                   # Reusable NixOS modules
│   ├── users/
│   │   └── primary/
│   │       ├── home.nix               # User-specific home-manager config
│   │       └── modules/               # User-specific modules
│   ├── README.md                      # The README.md files you are currently reading.
│   └── LICENSE
└── private/                           # Personal information to be kept private
    ├── .git/
    ├── personal.nix                    # Your personal information
    └── system/
        └── hardware-configuration.nix
```

## System Design

### private.nix

*personal.nix* is used to store information such as your hostname and username.

### personal/system/

*personal/system/* is used to store your computers hardware information.

## Using NixOS-Private

### Pulling From A Private Repository

```bash
cd ~/system_files/public

# Edit the flake.nix to match your private repository. i.e. url = "git+ssh://git@github.com/BenjaminSLS/redmont-private.git"; -> url = "git+ssh://git@github.com/{username}/{repository}.git";

cd ..

git clone git@github.com:BenjaminSLS/NixOS-Private.git

mv NixOS-Private private

cd private

cp ~/etc/nixos/hardware-configuration.nix system/

# Edit the personal.nix file's set username, hostname, timezone, and locale to match your desires.

cd ../public
```

### Rebuild Your New System

Once you are in ~/system_files/public:

```bash
sudo nixos-rebuild switch --flake .#
```

### Rollback if Something Breaks

```bash
sudo nixos-rebuild switch --rollback
```

or

Select a previous version when booting up.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

Copyright (c) 2026 Benjamin (Ben) LaShell

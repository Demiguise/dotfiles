import platform

from pathlib import Path
from enum import Enum

class BaseConfig():
    def __init__(self) -> None:
        self.name = "Base"
        self.symlinks = {
            "git/.gitconfig": ".gitconfig",
        }

class Windows(BaseConfig):
    def __init__(self) -> None:
        super().__init__()
        self.name = "Windows"

        self.symlinks["nvim"] = "AppData\\Local\\nvim"

class Linux(BaseConfig):
    def __init__(self) -> None:
        super().__init__()
        self.name = "Linux"

        self.symlinks["bash/.bashrc"] = ".bashrc"
        self.symlinks["nvim"] = "~/.config/nvim"

class MacOS(BaseConfig):
    def __init__(self) -> None:
        super().__init__()
        self.name = "MacOS"

        self.symlinks["bash/.bashrc"] = ".bashrc"
        self.symlinks["nvim"] = "~/.config/nvim"

def get_platform() -> BaseConfig:
    plat = platform.system()
    if plat == "Windows":
        return Windows()
    elif plat == "Linux":
        return Linux()
    elif plat == "Darwin":
        return MacOS()
    else:
        return BaseConfig()

def main() -> None:
    config = get_platform()

    print(f"Setting up dotfiles for [{config.name}]")
    for src, dst in config.symlinks.items():
        out = Path.home().joinpath(dst).absolute()
        abs_src = Path(src).absolute()
        try:
            print(f"Linking [{out}] to point at [{abs_src}]")
            out.symlink_to(abs_src)
        except Exception as e:
            print(f"\tFailed: {e}")

if __name__ == "__main__":
    main()

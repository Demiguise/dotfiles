" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont! FiraCode NF:h12
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif
local sep = '--'
return sep .. ' `:b%n` %f%m %#LineNr# %y[%{&fileencoding}]%r%w ' .. sep .. ' (%l/%L):%c ' .. sep .. '%<%='

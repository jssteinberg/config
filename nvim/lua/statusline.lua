local sep = '--'
return sep .. ' `:b%n` %f%m%r %#LineNr# %y[%{&fileencoding}]%w ' .. sep .. ' (%l/%L):%c ' .. sep .. '%<%='

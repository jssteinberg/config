local sep = '--'
return ' `:b%n` %m%f %#LineNr# %y[%{&fileencoding}]%r%w ' .. sep .. ' (%l/%L):%c %<%='

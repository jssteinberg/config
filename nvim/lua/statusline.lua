local sep = '--'
return sep .. ' `:b%n` %t%m%r%q %#LineNr# %y[%{&fileencoding}]%w ' .. sep .. ' %p%% (%l/%L):%c ' .. sep .. '%<%='

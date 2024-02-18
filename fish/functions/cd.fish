function cd
    zoxide query $argv; and zoxide cd $argv
    or command cd $argv
end

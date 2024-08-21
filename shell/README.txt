Bash-scripting learner repo: https://github.com/SathvikPN/bash-scripting

Subject: Difference between .bashrc .bash-profile .profile

[Bash Shell]
1. Interactive login shell:
        log into a system using ssh
        reads startup files when invoked
        /etc/profile (Always)
        $HOME/{.bash_profile, .bash_login, .profile}
                short-circuit order
                individual profile settings that overrride the variables set in the /etc/profile file
                
2. Interactive Non-login shell:
        when we invoke a new shell on an already logged-in shell
        executes only the .bashrc file
        source $HOME/.bashrc if exist (every interactive non-login shell)
        
3. Non-interactive shell:
        when a script forks a child shell for execution of commands, the child shell in non-interactive.
        doesn't execute any startup file
        Inherits environment variables from the parent shell
       
[Tips]
startup files: Environment variables (set once and inherited for other shells)
.bashrc: aliases and functions (to load them for every shell in current environment)

To avoid shell setup differences between login and non-login shells
        profile startup file calls .bashrc
        
[See Git Repo status in any shell]
https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

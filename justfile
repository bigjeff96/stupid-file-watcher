set shell := ["bash", "-uc"]

find := if os() == "windows" {"/cygdrive/c/cygwin64/bin/find.exe"} else {"find"}
exe := "stupid_file_watcher.exe"
debug_exe := "stupid_file_watcher_debug.exe"
gf2 := "/home/joe/.local/bin/gf2"

debug:
    just fmt
    time g++ main.cpp -Wall -Wextra -Werror -pedantic -ggdb -o {{exe}} -fsanitize=address,undefined,leak
    # just move_exe

debug-run:
	just debug
	./{{exe}}

gf:
	just debug
	{{gf2}} {{exe}}
	
#ignore
debug-watch:
    #!/bin/sh
    just debug
    clear
    echo -e '\rok'
    just move_exe

release:
    g++ main.cpp -Wall -Wextra -Werror -O3 -o {{exe}}
	
#Line count of project
loc:
    tokei -t C++ -o json . | jq '.["C++"].code + .["C++"].comments'
install:
    just release
    mv {{exe}} /cygdrive/c/Projects/bin/{{exe}}

fmt:
	clang-format -i *.cpp

move_exe:
    #!/bin/sh
    mv {{exe}} {{debug_exe}}


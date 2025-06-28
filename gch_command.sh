sudo su
cd /usr/include/x86_64-linux-gnu/c++/13/bits
mkdir stdc++.gch
g++ -Wall -Wextra -DLocal -std=gnu++20 stdc++.h -o stdc++.gch/h1.gch
g++ -Wall -Wextra -Wshadow -Wconversion -Wfloat-equal -fsanitize=address -fno-omit-frame-pointer -g -DLocal -D_GLIBCXX_DEBUG -std=gnu++20 stdc++.h -o stdc++.gch/h2.gch

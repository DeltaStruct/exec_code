cd /usr/include/x86_64-linux-gnu/c++/15/bits
sudo mkdir stdc++.gch
sudo g++-15.2.0 -Wall -Wextra -DLocal -std=gnu++23 stdc++.h -o stdc++.gch/h1.gch
sudo g++-15.2.0 -Wall -Wextra -Wshadow -Wconversion -Wfloat-equal -fsanitize=address -fno-omit-frame-pointer -g -DLocal -D_GLIBCXX_DEBUG -std=gnu++23 stdc++.h -o stdc++.gch/h2.gch
ls stdc++.gch

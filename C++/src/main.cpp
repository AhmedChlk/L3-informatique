#include <iostream>
#include "List.hpp"

int main() {
    List<int> l;
    l.push_front(10);
    l.push_front(5);
    l.push_back(15);
    l.insert(3,4);
    l.print_list();
    l.erase(3);

    l.print_list();

}

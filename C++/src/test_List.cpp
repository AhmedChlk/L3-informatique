#include "List.hpp"
#include <iostream>
#include <stdexcept>

bool testEmpty() {
    std::cout << "Test empty()... ";
    List<int> l;
    bool ok = (l.empty() == true);
    l.push_back(42);
    ok = ok && (l.empty() == false);
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testPushFront() {
    std::cout << "Test push_front()... ";
    bool ok = true;
    List<int> l;
    ok = ok && l.empty() && (l.get_size() == 0);
    l.push_front(42);
    ok = ok && (l.get_size() == 1) && (l.front() == 42) && (l.back() == 42) && !l.empty();
    l.push_front(20);
    ok = ok && (l.get_size() == 2) && (l.front() == 20) && (l.back() == 42);
    if (!ok) { l.print_list(); }
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testPushBack() {
    std::cout << "Test push_back()... ";
    bool ok = true;
    List<int> l;
    ok = ok && l.empty() && (l.get_size() == 0);
    l.push_back(42);
    ok = ok && (l.get_size() == 1) && (l.front() == 42) && (l.back() == 42) && !l.empty();
    l.push_back(20);
    ok = ok && (l.get_size() == 2) && (l.front() == 42) && (l.back() == 20);
    if (!ok) { l.print_list(); }
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testCopyConstructor() {
    std::cout << "Test copie profonde... ";
    bool ok = true;
    List<int> original;
    original.push_back(1);
    original.push_back(2);
    List<int> copie(original);
    ok = ok && (copie.get_size() == 2) && (copie.front() == 1) && (copie.back() == 2);
    original.push_back(3);
    ok = ok && (copie.get_size() == 2)
              && (copie.front() == 1)
              && (copie.back() == 2);
    List<int> vide;
    List<int> copieVide(vide);
    ok = ok && copieVide.empty() && (copieVide.get_size() == 0);
    if (!ok) {
        std::cout << "\nDebug original : ";
        original.print_list();
        std::cout << "Debug copie : ";
        copie.print_list();
    }
    std::cout << (ok ? "RÉUSSI (deep copy confirmée)" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testInsert() {
    std::cout << "Test insert()... ";
    bool ok = true;
    List<int> l;
    l.push_back(1);
    l.push_back(3);
    l.insert(0, 2); // [1,2,3]
    ok = ok && l.get_size() == 3 && l.front() == 1 && l.back() == 3;
    ok = ok && (l.getAt(1) == 2);
    l.insert(2, 4); // [1,2,3,4]
    ok = ok && l.back() == 4 && l.get_size() == 4;
    if (!ok) l.print_list();
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testErase() {
    std::cout << "Test erase()... ";
    bool ok = true;
    List<int> l;
    l.push_back(10);
    l.push_back(20);
    l.push_back(30); // [10,20,30]
    l.erase(1);      // [10,30]
    ok = ok && l.get_size() == 2 && l.front() == 10 && l.back() == 30;
    l.erase(0);      // [30]
    ok = ok && l.get_size() == 1 && l.front() == 30 && l.back() == 30;
    l.erase(0);      // []
    ok = ok && l.get_size() == 0 && l.empty();
    try { l.erase(0); ok = false; }
    catch(const std::out_of_range&) { }
    catch(...) { ok = false; }
    if (!ok) l.print_list();
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testClear() {
    std::cout << "Test clear()... ";
    bool ok = true;
    List<int> l;
    l.push_back(5);
    l.push_back(15);
    l.push_back(25);
    l.clear();
    ok = ok && l.get_size() == 0 && l.empty();
    l.clear();
    ok = ok && l.get_size() == 0 && l.empty();
    if (!ok) l.print_list();
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

int main() {
    int nbTests = 7, echecs = 0;
    if (!testEmpty()) echecs++;
    if (!testPushFront()) echecs++;
    if (!testPushBack()) echecs++;
    if (!testCopyConstructor()) echecs++;
    if (!testInsert()) echecs++;
    if (!testErase()) echecs++;
    if (!testClear()) echecs++;
    std::cout << "\nRésumé examen : " << nbTests << " tests exécutés, " << echecs << " échecs.\n";
    if (echecs == 0)
        std::cout << "Tests Unitaires Validés \n";
    return echecs > 0 ? 1 : 0;
}

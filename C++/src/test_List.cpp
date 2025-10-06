#include "List.hpp"
#include <iostream>
#include <stdexcept>


// Test pour empty()
bool testEmpty() {
    std::cout << "Test empty()... ";
    List<int> l;
    bool ok = (l.empty() == true); //Cas Vide
    l.push_back(42);
    ok = ok && (l.empty() == false);  // Cas non vide
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testPushFront() {
    std::cout << "Test push_front()... ";
    bool ok = true;

    List<int> l;  // Prépare : liste vide
    ok = ok && l.empty() && (l.get_size() == 0);  // Vérifie état initial

    l.push_front(42);  // Agit : premier push (sur vide)
    ok = ok && (l.get_size() == 1) && (l.front() == 42) && (l.back() == 42) && !l.empty();  // Vérifie après un élément

    l.push_front(20);  // Agit : second push
    ok = ok && (l.get_size() == 2) && (l.front() == 20) && (l.back() == 42);  // Vérifie ordre : 20 en front, 42 en back

    // Debug si échec
    if (!ok) {
        std::cout << "Debug liste : ";
        l.print_list();
    }
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}

bool testPushBack() {
    std::cout << "Test push_back()... ";
    bool ok = true;

    List<int> l;  // Prépare : liste vide
    ok = ok && l.empty() && (l.get_size() == 0);  // Vérifie état initial

    l.push_back(42);  // Agit : premier push (sur vide)
    ok = ok && (l.get_size() == 1) && (l.front() == 42) && (l.back() == 42) && !l.empty();  // Vérifie après un élément

    l.push_back(20);  // Agit : second push
    ok = ok && (l.get_size() == 2) && (l.front() == 42) && (l.back() == 20);  // Vérifie ordre : 20 en front, 42 en back

    // Debug si échec
    if (!ok) {
        std::cout << "Debug liste : ";
        l.print_list();
    }
    std::cout << (ok ? "RÉUSSI" : "ÉCHOUÉ") << "\n";
    return ok;
}


bool testCopyConstructor() {
    std::cout << "Test copie profonde... ";
    bool ok = true;

    // Prépare : liste originale non vide
    List<int> original;
    original.push_back(1);
    original.push_back(2);  // Taille 2, {1,2}

    // Agit : copie
    List<int> copie(original);

    // Vérif 1 : Copie initiale
    ok = ok && (copie.get_size() == 2) && (copie.front() == 1) && (copie.back() == 2);

    // Vérif 2 : Modification de l'originale
    original.push_back(3);  // taille 3, {1,2,3}
    ok = ok && (copie.get_size() == 2)
               && (copie.front() == 1) 
               && (copie.back() == 2);

    // Vérif 3 : Copie d'une liste vide
    List<int> vide;
    List<int> copieVide(vide);
    ok = ok && copieVide.empty() && (copieVide.get_size() == 0);


    // si échec
    if (!ok) {
        std::cout << "\nDebug original : ";
        original.print_list();
        std::cout << "Debug copie : ";
        copie.print_list();
    }

    std::cout << (ok ? "RÉUSSI (deep copy confirmée)" : "ÉCHOUÉ") << "\n";
    return ok;
}

int main() {
    int nbTests = 4;
    int echecs = 0;

    if (!testEmpty()) echecs++;
    if (!testPushFront()) echecs++;
    if (!testPushBack()) echecs++;
    if (!testCopyConstructor()) echecs++;

    std::cout << "\nRésumé examen : " << nbTests << " tests exécutés, " << echecs << " échecs.\n";
    if (echecs == 0) {
        std::cout << "Tests Unitaires Validés \n";
    }
    return echecs > 0 ? 1 : 0;
}
#include "CUnit/Basic.h"
#include <stdio.h>
#include <stdlib.h>

// #include "../include/board.h"
// #include "../include/constante.h"
// #include "../include/interface.h"
#include "../include/tetromino.h"

// Vos tests doivent inclure (au moins) les nouvelles règles du jeu. Par exemple
// :

//     Rotation d'une pièce avant placement
//     Rotation d'une pièce après placement
//     Rotation d'une pièce après placement (affichage)
//     Placement d'une avid Roussel, Laurence Bourard, Massinissa Merabet
//     Tout autre test pièce dans la réserve
//     Placement d'une pièce dans la réserve (affichage)
//     Suppression d'une pièce dans la réserve après deux placements
//     Récupération d'une carte sur le plateau
//     Récupération d'une carte sur le plateau (affichage)
//     Test des cartes Dqui vous vienne à l'esprit.

// void sum_test() {
//   // Check if first param matches with second[2]
//   CU_ASSERT_EQUAL(sum(2, 14), 16);
//   CU_ASSERT_EQUAL(sum(0, 0), 0);
//   CU_ASSERT_EQUAL(sum(-1 ,6), 5);
// }

void rotation_avant_placement() {

  enum {I , O, T, L, J, S, Z };
  // (0: I, 1: O, 2: T, 3: L, 4: J, 5: S, 6f: Z)
  // test la fonction de rotation
  // CU_ASSERT_EQUAL(t2, t1);
  for (int i = 0; i<6; i++){
    tetromino t1 = create_tetromino(i, 0, 1);
    tetromino t2 = create_tetromino(i, 0, 1);
    rotate_90(t2, 1, 1);
    CU_ASSERT_EQUAL(t2, t1);
    
  }



  return;
}

void rotation_apres_placement() { return; }
void rotation_apres_placement_affichage() { return; }

void placement_piece_reserve() { return; }

void placement_piece_reserve_affichage() { return; }

void suppression_apres_deplacement() { return; }

void recuperaion_carte_plateau() { return; }

void recuperation_carte_plateau_affichage() { return; }

void carte_DLM() { return; }

int main() {
  // Initialize the CUnit test registry
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error(); // Sets the basic run mode, CU_BRM_VERBOSE will show
                           // maximum output of run details

  CU_pSuite pSuite = NULL; // Add a suite to the registry

  pSuite = CU_add_suite("sum_test_suite", 0,
                        0); // Always check if add was successful
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  // Add the test to the suite
  if (/*  (NULL == CU_add_test(pSuite, "sum_test", sum_test)) || */
      (NULL == CU_add_test(pSuite, "Test rotation d'une pièce avant placement",
                           rotation_avant_placement)) ||
      (NULL == CU_add_test(pSuite, "Test rotation d'une pièce après placement",
                           rotation_apres_placement)) ||
      (NULL ==
       CU_add_test(pSuite,
                   "Test rotation d'une pièce après placement (affichage)",
                   rotation_apres_placement_affichage)) ||
      (NULL == CU_add_test(pSuite, "Test placement d'une pièce dans la réserve",
                           placement_piece_reserve)) ||
      (NULL ==
       CU_add_test(pSuite,
                   "Test placement d'une pièce dans la réserve (affichage)",
                   placement_piece_reserve_affichage)) ||
      (NULL ==
       CU_add_test(
           pSuite,
           "Test suppression d'une pièce dans la réserve après deux placements",
           suppression_apres_deplacement)) ||
      (NULL == CU_add_test(pSuite,
                           "Test récupération d'une carte sur le plateau",
                           recuperaion_carte_plateau)) ||
      (NULL ==
       CU_add_test(pSuite,
                   "Test récupération d'une carte sur le plateau (affichage)",
                   recuperation_carte_plateau_affichage)) ||
      (NULL == CU_add_test(pSuite,
                           "Test des cartes David Roussel, Laurence Bourard, "
                           "Massinissa Merabet",
                           carte_DLM))) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  // Other choices are: CU_BRM_SILENT and CU_BRM_NORMAL
  CU_basic_set_mode(CU_BRM_VERBOSE); // Run the tests and show the run summary
  CU_basic_run_tests();

  return CU_get_error();
}

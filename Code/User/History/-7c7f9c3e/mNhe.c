#include <stdio.h>
#include <string.h>

#include "../include/board.h"
#include "../include/interface.h"
#include "../include/tetromino.h"


/**
  * \file main.c
  * Ce fichier contient le code source du programme principal et gère l'articulation centrale de la boucle de jeu.
  * \author Simon Bélier
*/


/**
  * \brief Cette fonction qui sert a gérer la fin du jeu (libération mémoire et affichage de fin)
  * @param b un \b board 
  * @return nothing
*/
void end_game(board b){
  

  display_end_message(b);

}


/**
  * \details Boucle principale du jeu: tant que le joueur n'a pas quitté le jeu, plusieurs choix.
  *   1) Prendre tétromino dans le sac et le placer sur la grille
  *   2) Déplacer un tétromino qui est déjà sur la grille 
  * Version avancé du jeu : 
  *   - Les tetrominos peuvent etre pivotés à tout moment
  *   - Une reservé peut être constituée our retirer des tetrominos de la grille
  *   - Des cartes viennent ajouter des actions spéciales
  *
  * \parblock
  * Options disponibles : 
  *   - \b{-a}  pour débloquer le jeu en mode avancé
  * \endparblock
  * \return 1 si aucune erreur sinon code d'erreur
*/
int main(int argc, char* argv[]){

  //booleen qui controle le mode avancé
  int is_advanced = 0;
  //test des options 
  for (int i = 1; i < argc; ++i){
      if (argv[i][0] == '-' ){

        switch (argv[i][1])
        {
        case 'a':
          is_advanced = 1;
          break;
        
        default:
          break;
        }
      }
    }
  


  //entier qui servira  garder le caractère donné en mémoire
  int action;
 

  //initialisation des objets nécessaires
  int nb_lignes = 10;
  int nb_colonnes = 10;
  int taille_sac = 4;
  board plateau = create_board(nb_lignes,nb_colonnes,taille_sac);


  //sert a stocker le tetromino a placer
  tetromino selected_tetromino;
  int* new_pr = malloc(sizeof(int)); int* new_pc=malloc(sizeof(int)); //stocke les prochaines coordonnées du tetromino selectioné
  int* old_pr= malloc(sizeof(int)); int* old_pc= malloc(sizeof(int)); //stocke les anciennes coordonnées du tetromino selectioné

  
  //remplissage du sac
  for (int i = 0; i< taille_sac; i++ ){
    add_tetromino_to_bag(plateau, create_random_tetromino());
  } 

  display_board(plateau);
  
  //boucle de jeu
  for(;;){
    
    action = choose_action();

    if (action == 0){
      end_game(plateau);
      break;
    } 
    
    //prendre un tetromino dans le sac et le placer
    else if (action == 1){

      //on demande a l'utilisateur de selectionner un tetromino du sac
      selected_tetromino = select_tetromino_in_bag(plateau);

      //on supprime le tetromino selectionné du sac puis on le re-rempli
      remove_tetromino_from_bag(plateau, selected_tetromino);
      add_tetromino_to_bag(plateau, create_random_tetromino());


      //on demande les coordonnées où placer le tetromino
      ask_place_tetromino(plateau, new_pr, new_pc);
      //on vérifie que le tetromino peut aller là où c'est demandé
      //si non : message d'erreur et on recommence 
      if ( !check_place_tetromino(plateau, *new_pr, *new_pc, selected_tetromino)){
        printf("Impossible de placer le tetromino ici\n");
      }
      //si oui : on place le tetromino sur la board
      else{
        place_tetromino(plateau, *new_pr, *new_pc,selected_tetromino);
      }

    }

    //déplacer un tetromino sur la grille
    else if (action == 2){

      //on demande les coordonnées du tetromino à déplacer et on enleve se dernier de la grille
      selected_tetromino = get_tetromino(plateau, *old_pr, *old_pc);
      remove_tetromino(plateau, old_pr, old_pc, selected_tetromino);

      //on demande les coordonnées où placer le tetromino
      ask_place_tetromino(plateau, new_pr, new_pc);
      //on vérifie que le tetromino peut aller là où c'est demandé
      //si non : message d'erreur et on replace le tetromino aux coordonnées originales
      if ( !check_place_tetromino(plateau, *new_pr, *new_pc, selected_tetromino)){
        printf("Impossible de placer le tetromino ici\n");
        place_tetromino(plateau, *old_pr, *old_pc, selected_tetromino);
      }
      //si oui : on place le tetromino sur la board
      else{
        place_tetromino(plateau, *new_pr, *new_pc,selected_tetromino);
      }
      display_board(plateau);
    }
  }
  
  return 0;

}


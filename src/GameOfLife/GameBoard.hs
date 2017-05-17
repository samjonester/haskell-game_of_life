module GameOfLife.GameBoard (GameBoard(..)) where

import GameOfLife.Cell (Cell)

data GameBoard = GameBoard [Cell]

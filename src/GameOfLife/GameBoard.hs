module GameOfLife.GameBoard (GameBoard(..)) where

import Data.List (sort)
import GameOfLife.Cell (Cell)

data GameBoard = GameBoard [Cell]

instance Eq GameBoard where
  (==) (GameBoard cells1) (GameBoard cells2) = sort cells1 == sort cells2

module GameOfLife.Visualizer (visualize) where

import Data.List (sort)
import qualified GameOfLife.Cell (display)
import GameOfLife.GameBoard

visualize :: GameBoard -> String
visualize (GameBoard cells) = joinStrings . displayCells . sort $ cells
  where
    displayCells = map GameOfLife.Cell.display
    joinStrings = foldl (++) ""

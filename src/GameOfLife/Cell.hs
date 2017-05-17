module GameOfLife.Cell ( Cell(..)
                       , isNeighbour
                       ) where

import GameOfLife.Position (Position)

data Cell = LivingCell Position | DeadCell Position
  deriving
    Show

isNeighbour :: Cell -> Cell -> Bool
isNeighbour = undefined

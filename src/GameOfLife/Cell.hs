module GameOfLife.Cell ( Cell(..)
                       , isNeighbour
                       ) where

import GameOfLife.Position (Position)
import qualified GameOfLife.Position (isNeighbour)

data Cell = LivingCell Position | DeadCell Position
  deriving
    Show

isNeighbour :: Cell -> Cell -> Bool
isNeighbour c1 c2 = GameOfLife.Position.isNeighbour (getPosition c1) (getPosition c2)


getPosition (LivingCell pos) = pos
getPosition (DeadCell pos) = pos

module GameOfLife.Cell ( Cell(..)
                       , isNeighbour
                       , display
                       ) where

import GameOfLife.Position (Position)
import qualified GameOfLife.Position (isNeighbour, display)

data Cell = LivingCell Position | DeadCell Position
  deriving
    Show

instance Eq Cell where
  (==) (LivingCell pos1) (LivingCell pos2) = pos1 == pos2
  (==) (DeadCell pos1) (DeadCell pos2) = pos1 == pos2
  (==) _ _ = False

instance Ord Cell where
  compare c1 c2 = compare (getPosition c1) (getPosition c2)


isNeighbour :: Cell -> Cell -> Bool
isNeighbour c1 c2 = GameOfLife.Position.isNeighbour (getPosition c1) (getPosition c2)


getPosition (LivingCell pos) = pos
getPosition (DeadCell pos) = pos


display :: Cell -> String
display (LivingCell pos) = GameOfLife.Position.display pos ++ "X"
display (DeadCell pos) = GameOfLife.Position.display pos ++ " "

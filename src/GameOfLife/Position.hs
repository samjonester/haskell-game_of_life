module GameOfLife.Position ( Position(..)
                           , isNeighbour
                           ) where

type X = Int
type Y = Int

data Position = Position X Y
  deriving
    Show

isNeighbour :: Position -> Position -> Bool
isNeighbour (Position x1 y1) (Position x2 y2)
  | x1 == x2 && abs (y1 - y2) == 1  = True
  | y1 == y2 && abs (x1 - x2) == 1  = True
  | otherwise                       = False

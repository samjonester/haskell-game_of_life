module GameOfLife.Position ( Position(..)
                           , isNeighbour
                           ) where

type X = Int
type Y = Int

data Position = Position X Y
  deriving
    Show

isNeighbour :: Position -> Position -> Bool
isNeighbour = undefined
